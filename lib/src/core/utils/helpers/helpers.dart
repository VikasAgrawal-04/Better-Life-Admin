import 'dart:io' as io;

import 'package:better_life_admin/src/core/error/exception.dart';
import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

enum RequestType { get, post, put, delete }

enum LoggerType { d, e, i, f, t, w }

class Helpers {
  static SharedPreferences? prefs;

  static void logger({required LoggerType type, required String message}) {
    final logger = Logger(
        printer: PrettyPrinter(
            lineLength: io.stdout.terminalColumns,
            colors: io.stdout.supportsAnsiEscapes));

    switch (type) {
      case LoggerType.d:
        logger.d(message);
        break;
      case LoggerType.e:
        logger.e(message);
        break;
      case LoggerType.i:
        logger.i(message);
        break;
      case LoggerType.f:
        logger.f(message);
        break;
      case LoggerType.t:
        logger.t(message);
        break;
      case LoggerType.w:
        logger.w(message);
        break;
    }
  }

  static Future<Map<String, dynamic>?> sendRequest(
      Dio dio, RequestType type, String path,
      {Map<String, dynamic>? queryParams,
      bool encoded = false,
      dynamic data,
      dynamic listData,
      FormData? formData}) async {
    //Setting Token After the login
    void _setToken(String token) {
      dio.options.headers = {
        "Authorization": 'Bearer $token',
        'Accept': 'application/json'
      };
    }

    var logger = Logger(
      printer: PrettyPrinter(
          methodCount: 2,
          errorMethodCount: 8,
          lineLength: 50,
          colors: true,
          printEmojis: true,
          printTime: false),
    );
    logger.d("PayLoad ${queryParams ?? data ?? listData}");
    try {
      Response response;

      switch (type) {
        case RequestType.get:
          response = (await dio.get(path, queryParameters: queryParams));
          break;
        case RequestType.post:
          response = (await dio.post(
            path,
            options: Options(
                contentType:
                    encoded == true ? Headers.formUrlEncodedContentType : null,
                validateStatus: (code) => true),
            data: queryParams ?? listData ?? formData ?? FormData.fromMap(data),
          ));
          break;
        case RequestType.put:
          response =
              await dio.put(path, data: data, queryParameters: queryParams);
          break;
        case RequestType.delete:
          response = (await dio.delete(path, queryParameters: queryParams));
          break;
        default:
          return null;
      }

      logger.d(
          "$path response status code ${response.statusCode} message is ${response.statusMessage}");

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else if (response.statusCode == 400 || response.statusCode == 202) {
        logger.e(
            "Failed response ${response.data} and ${response.statusMessage} and ${response.statusCode} ");
        throw ServerException(
            code: response.statusCode, message: response.statusMessage);
      } else {
        debugPrint("I go here 1");
        debugPrint("statuscode${response.statusCode.toString()}");
        debugPrint(response.statusMessage.toString());
        debugPrint(response.data.toString());
        throw ServerException(
            message:
                response.data['message'] ?? response.data['errors']['message'],
            code: response.statusCode);
      }
    } on ServerException catch (e) {
      debugPrint("I go here 2");
      throw ServerException(message: e.message, code: e.code);
    } on DioException catch (e) {
      debugPrint("Dio Exception${e.response?.data}");
      if (e.error == "Http status error [401]") {
        debugPrint("I go here 3 ${e.error == "Http status error [401]"}");
      } else {
        throw ServerException(
            message: e.error is io.SocketException
                ? "No Internet"
                : e.response?.data['message'].toString());
      }
    }
    return null;
  }

  static String convertFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    }
    return "Unknown error occured";
  }

  static setString({required String key, required String value}) async {
    await prefs?.setString(key, value);
  }

  static deleteString({required key}) {
    prefs?.remove(key);
  }

  static String? getString({required String key}) {
    return prefs?.getString(key);
  }

  static clearShared() async {
    await prefs?.clear();
  }

  static Future<void> makeCall(String number) async {
    final url = Uri.parse('tel:$number');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

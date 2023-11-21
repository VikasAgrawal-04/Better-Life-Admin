import 'package:better_life_admin/services/api/repo/reports_repo.dart';
import 'package:better_life_admin/src/core/error/exception.dart';
import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/core/utils/constants/api_endpoints.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/response/sales_caretaker_model.dart';
import 'package:better_life_admin/src/models/response/sales_reports_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ReportsRepoImpl implements ReportsRepo {
  @override
  Future<Either<Failure, SalesReportsModel>> fetchSalesReport(
      {String? fromDate, String? toDate}) async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.post, EndPoints.salesReport,
          queryParams: {'fromDate': fromDate, 'toDate': toDate});

      return Right(SalesReportsModel.fromJson(response ?? {}));
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SalesCaretakerModel>> fetchCaretaker() async {
    try {
      final response =
          await Helpers.sendRequest(RequestType.get, EndPoints.caretakerList);

      return Right(SalesCaretakerModel.fromJson(response ?? {}));
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SalesReportsModel>> fetchCareReports(
      {required int caretakerId, String? fromDate, String? toDate}) async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.post, EndPoints.caretakerReport, queryParams: {
        'fromDate': fromDate,
        'toDate': toDate,
        'caretakerId': caretakerId
      });
      return Right(SalesReportsModel.fromJson(response ?? {}));
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

import 'package:better_life_admin/services/api/repo/care_repo.dart';
import 'package:better_life_admin/src/core/error/exception.dart';
import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/core/utils/constants/api_endpoints.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/response/new_caretaker_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class CareRepoImpl implements CareRepo {
  @override
  Future<Either<Failure, NewCaretakerResponse>> getNewCaretaker() async {
    try {
      final response =
          await Helpers.sendRequest(RequestType.put, EndPoints.newCaretakers);
      if (response?['code'] != '200') {
        return Left(ServerFailure(message: response?['message']));
      }
      return Right(NewCaretakerResponse.fromJson(response ?? {}));
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

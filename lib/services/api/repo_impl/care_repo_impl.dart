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

  @override
  Future<Either<Failure, Map<String, dynamic>>> actionOnApplication(
      {required bool reject, required int caretakerId}) async {
    try {
      final path = {
        false: '${EndPoints.approveCaretakers}/$caretakerId',
        true: '${EndPoints.rejectCaretakers}/$caretakerId'
      };
      final response =
          await Helpers.sendRequest(RequestType.put, path[reject].toString());
      if (response?['code'] != '200') {
        return Left(ServerFailure(message: response?['message']));
      }
      return Right(response ?? {});
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> assignCaretaker(
      {required int apptId, required String caretakerId}) async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.post, EndPoints.assignCaretakers,
          queryParams: {'caretakerid': caretakerId, 'apptid': apptId});
      if (response?['code'] != '200') {
        return Left(ServerFailure(message: response?['message']));
      }
      return Right(response ?? {});
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

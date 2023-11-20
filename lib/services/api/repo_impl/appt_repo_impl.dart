import 'package:better_life_admin/services/api/repo/appt_repo.dart';
import 'package:better_life_admin/src/core/error/exception.dart';
import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/core/utils/constants/api_endpoints.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/response/appt_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ApptRepoImpl implements ApptRepo {
  @override
  Future<Either<Failure, ApptResponseModel>> fetchAppt(ApptType type) async {
    try {
      final path = {
        ApptType.past: EndPoints.pastAppt,
        ApptType.today: EndPoints.todayAppt,
        ApptType.upcoming: EndPoints.upcomingAppt
      };
      final response =
          await Helpers.sendRequest(RequestType.put, path[type].toString());
      return Right(ApptResponseModel.fromJson(response ?? {}));
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

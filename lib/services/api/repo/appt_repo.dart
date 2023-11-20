import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/response/appt_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class ApptRepo {
  Future<Either<Failure, ApptResponseModel>> fetchAppt(ApptType type);
}

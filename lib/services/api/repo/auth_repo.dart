import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/models/params/login_params.dart';
import 'package:better_life_admin/src/models/response/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> signIn({required LoginParams data});
}

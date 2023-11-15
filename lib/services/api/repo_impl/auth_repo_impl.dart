import 'package:better_life_admin/services/api/repo/auth_repo.dart';
import 'package:better_life_admin/src/core/error/exception.dart';
import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/core/utils/constants/api_endpoints.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/params/login_params.dart';
import 'package:better_life_admin/src/models/response/login_response.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, LoginResponse>> signIn(
      {required LoginParams data}) async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.post, EndPoints.login,
          data: data.toJson());
      if (response?['code'] != '200') {
        return Left(ServerFailure(message: response?['message']));
      }
      return Right(LoginResponse.fromJson(response!));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

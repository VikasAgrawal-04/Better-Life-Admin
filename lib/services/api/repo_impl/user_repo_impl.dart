import 'package:better_life_admin/services/api/repo/user_repo.dart';
import 'package:better_life_admin/src/core/error/exception.dart';
import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/core/utils/constants/api_endpoints.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/response/verified_customer_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UserRepoImpl implements UserRepo {
  @override
  Future<Either<Failure, VerifiedCustomerResponse>>
      fetchVerifiedCustomer() async {
    try {
      final response =
          await Helpers.sendRequest(RequestType.put, EndPoints.customers);
      if (response?['code'] != '200') {
        return Left(ServerFailure(message: response?['message']));
      }
      return Right(VerifiedCustomerResponse.fromJson(response ?? {}));
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

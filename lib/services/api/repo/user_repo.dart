import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/response/customer_detail_response_model.dart';
import 'package:better_life_admin/src/models/response/verified_caretaker_response_model.dart';
import 'package:better_life_admin/src/models/response/verified_customer_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either<Failure, VerifiedCustomerResponse>> fetchVerifiedCustomer();
  Future<Either<Failure, VerifiedCaretakerModel>> fetchVerifiedCaretaker();
  Future<Either<Failure, Map<String, dynamic>>> actionCaretaker(
      Axn action, int careId);
  Future<Either<Failure, Map<String, dynamic>>> actionCustomer(
      Axn action, int cusId);
  Future<Either<Failure, CustomerDetailResponseModel>> fetchCustomerDetail(
      int cusId);
}

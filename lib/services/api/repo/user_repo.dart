import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/models/response/verified_caretaker_response_model.dart';
import 'package:better_life_admin/src/models/response/verified_customer_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either<Failure, VerifiedCustomerResponse>> fetchVerifiedCustomer();
  Future<Either<Failure, VerifiedCaretakerModel>> fetchVerifiedCaretaker();
}

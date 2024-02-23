import 'package:better_life_admin/services/api/repo/user_repo.dart';
import 'package:better_life_admin/src/core/error/exception.dart';
import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/core/utils/constants/api_endpoints.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/models/response/caretaker_detail_response_model.dart';
import 'package:better_life_admin/src/models/response/customer_detail_response_model.dart';
import 'package:better_life_admin/src/models/response/verified_caretaker_response_model.dart';
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

  @override
  Future<Either<Failure, VerifiedCustomerResponse>> deactiveCustomer() async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.put, EndPoints.deactivedCustomer);
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

  @override
  Future<Either<Failure, VerifiedCaretakerModel>>
      fetchVerifiedCaretaker() async {
    try {
      final response =
          await Helpers.sendRequest(RequestType.put, EndPoints.caretaker);
      if (response?['code'] != '200') {
        return Left(ServerFailure(message: response?['message']));
      }
      return Right(VerifiedCaretakerModel.fromJson(response ?? {}));
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> actionCaretaker(
      Axn action, int careId) async {
    try {
      final path = {
        Axn.active: '${EndPoints.activateCaretaker}/$careId',
        Axn.deactivate: '${EndPoints.deactiveCaretaker}/$careId',
        Axn.delete: '${EndPoints.deleteCaretaker}/$careId'
      };
      final method = {
        Axn.active: RequestType.put,
        Axn.deactivate: RequestType.put,
        Axn.delete: RequestType.delete
      };
      final response =
          await Helpers.sendRequest(method[action]!, path[action]!);
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
  Future<Either<Failure, Map<String, dynamic>>> actionCustomer(
      Axn action, int cusId) async {
    try {
      final path = {
        Axn.active: '${EndPoints.activateCustomer}/$cusId',
        Axn.deactivate: '${EndPoints.deactiveCustomer}/$cusId',
        Axn.delete: '${EndPoints.deleteCustomer}/$cusId'
      };
      final method = {
        Axn.active: RequestType.put,
        Axn.deactivate: RequestType.put,
        Axn.delete: RequestType.delete
      };
      final response =
          await Helpers.sendRequest(method[action]!, path[action]!);
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
  Future<Either<Failure, CustomerDetailResponseModel>> fetchCustomerDetail(
      int cusId) async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.put, '${EndPoints.customerDetails}/$cusId');
      if (response?['code'] != '200') {
        return Left(ServerFailure(message: response?['message']));
      }
      return Right(CustomerDetailResponseModel.fromJson(response ?? {}));
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CaretakerDetailsModel>> fetchCaretakerDetail(
      int careId) async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.put, '${EndPoints.caretakerDetails}/$careId');
      if (response?['code'] != '200') {
        return Left(ServerFailure(message: response?['message']));
      }
      return Right(CaretakerDetailsModel.fromJson(response ?? {}));
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifiedCaretakerModel>>
      fetchDeactivatedCaretaker() async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.post, EndPoints.deactivedCaretakers,
          queryParams: {});
      if (response?['code'] != '200') {
        return Left(ServerFailure(message: response?['message']));
      }
      return Right(VerifiedCaretakerModel.fromJson(response ?? {}));
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifiedCaretakerModel>>
      fetchDeletedCaretaker() async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.put, EndPoints.rejectedCaretakers);
      if (response?['code'] != '200') {
        return Left(ServerFailure(message: response?['message']));
      }
      return Right(VerifiedCaretakerModel.fromJson(response ?? {}));
    } on ServerException catch (error, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: error.message.toString()));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

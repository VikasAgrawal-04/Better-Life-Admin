import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/models/response/new_caretaker_response.dart';
import 'package:dartz/dartz.dart';

abstract class CareRepo {
  Future<Either<Failure, NewCaretakerResponse>> getNewCaretaker();
  Future<Either<Failure, Map<String, dynamic>>> actionOnApplication(
      {required bool reject, required int caretakerId});

  Future<Either<Failure, Map<String, dynamic>>> assignCaretaker(
      {required int apptId, required String caretakerId});
}

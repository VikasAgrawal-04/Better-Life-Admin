import 'package:better_life_admin/src/core/error/failures.dart';
import 'package:better_life_admin/src/models/response/sales_caretaker_model.dart';
import 'package:better_life_admin/src/models/response/sales_reports_response.dart';
import 'package:dartz/dartz.dart';

abstract class ReportsRepo {
  Future<Either<Failure, SalesReportsModel>> fetchSalesReport(
      {String? fromDate, String? toDate});

  Future<Either<Failure, SalesCaretakerModel>> fetchCaretaker();
  Future<Either<Failure, SalesReportsModel>> fetchCareReports(
      {required int caretakerId, String? fromDate, String? toDate});
}

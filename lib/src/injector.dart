import 'package:better_life_admin/src/controllers/auth_controller.dart';
import 'package:better_life_admin/src/controllers/dashboard_controller.dart';
import 'package:better_life_admin/src/controllers/report_controller.dart';
import 'package:better_life_admin/src/controllers/user_controller.dart';
import 'package:get/get.dart';

class DependencyInjector {
  static void inject() {
    _injectControllers();
  }

  static void _injectControllers() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => ReportController(), fenix: true);
  }
}

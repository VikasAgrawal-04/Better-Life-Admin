import 'package:better_life_admin/src/controllers/auth_controller.dart';
import 'package:get/get.dart';

class DependencyInjector {
  static void inject() {
    _injectControllers();
  }

  static void _injectControllers() {
    Get.put(AuthController());
  }
}

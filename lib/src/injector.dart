import 'package:better_life_admin/src/core/utils/constants/keys.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependencyInjector {
  static void inject() {
    _injectDio();
    _injectControllers();
  }

  static String? checkToken() {
    final token = Helpers.getString(key: Keys.token);
    if (token != null) {
      return token;
    } else {
      return null;
    }
  }

  static void _injectDio() {
    final tokenPresent = checkToken();
    final dio = Dio(BaseOptions(
        baseUrl: 'https://goasocialmediamarketing.com/betterlifeapi/api',
        headers: tokenPresent != null
            ? {
                "Authorization": 'Bearer $tokenPresent',
                'Accept': 'application/json'
              }
            : null));
    Get.lazyPut(() => dio);
  }

  static void _injectControllers() {}
}

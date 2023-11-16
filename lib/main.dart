import 'package:better_life_admin/services/firebase/notifications.dart';
import 'package:better_life_admin/services/routing/router.dart';
import 'package:better_life_admin/services/routing/routes.dart';
import 'package:better_life_admin/src/core/utils/constants/keys.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/injector.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final notification = PushNotificationService();
  await notification.init();
  FirebaseMessaging.onBackgroundMessage(bgHandler);
  DependencyInjector.inject();
  SharedPreferences.getInstance().then((prefs) {
    Helpers.prefs = prefs; // Set the instance in your Helpers class
    final token = prefs.getString(Keys.token);
    final dio = Dio(BaseOptions(
        baseUrl: 'https://goasocialmediamarketing.com/betterlifeapi/api',
        headers: token != null
            ? {"Authorization": 'Bearer $token', 'Accept': 'application/json'}
            : null));
    dio.interceptors
        .add(PrettyDioLogger(requestBody: true, requestHeader: true));
    Helpers.dio = dio;
    runApp(const MyApp());
  });
}

Future<void> bgHandler(RemoteMessage message) async {
  final pushNotification = PushNotificationService();
  await pushNotification.handleMessage(message);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: ((context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppRouter.routes,
          initialRoute: AppRoutes.splash,
        );
      }),
    );
  }
}

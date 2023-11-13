import 'package:better_life_admin/services/firebase/notifications.dart';
import 'package:better_life_admin/src/core/utils/helpers/helpers.dart';
import 'package:better_life_admin/src/injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

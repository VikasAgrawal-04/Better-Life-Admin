import 'package:better_life_admin/services/routing/routes.dart';
import 'package:better_life_admin/src/middlewares/auth_guard.dart';
import 'package:better_life_admin/src/views/screens/auth/login.dart';
import 'package:better_life_admin/src/views/screens/auth/register.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/reports/caretaker_individual_reports.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/reports/sales_report.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/users/caretakers_page.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dash_pages/users/customers_page.dart';
import 'package:better_life_admin/src/views/screens/dashboard/dashboard.dart';
import 'package:better_life_admin/src/views/screens/splash/splash.dart';
import 'package:get/get.dart';

class AppRouter {
  static List<GetPage> routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(
        name: AppRoutes.dashboard,
        page: () => const Dashboard(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: AppRoutes.register,
        page: () => const RegisterScreen(),
        transition: Transition.downToUp),
    GetPage(
        name: AppRoutes.verifiedCaretakers,
        page: () => const VerifiedCaretakerPage()),
    GetPage(
        name: AppRoutes.verifiedCustomer,
        page: () => const VerifiedCustomerPage()),
    GetPage(name: AppRoutes.salesReports, page: () => const SalesReport()),
    GetPage(
        name: AppRoutes.caretakerReports, page: () => const CaretakerReports())
  ];
}

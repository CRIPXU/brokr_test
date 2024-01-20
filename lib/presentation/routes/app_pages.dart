import 'package:brokr_prueba/presentation/page/account_already_exists_page.dart';
import 'package:brokr_prueba/presentation/page/congratulations_page.dart';
import 'package:brokr_prueba/presentation/page/home_page.dart';
import 'package:brokr_prueba/presentation/page/login_page.dart';
import 'package:brokr_prueba/presentation/page/profile_photo_page.dart';
import 'package:brokr_prueba/presentation/page/register_page.dart';
import 'package:brokr_prueba/presentation/routes/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../page/splash_page.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.SPLASH, page: () => SplashPage()),
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage()),
    GetPage(name: AppRoutes.REGISTER, page: () => RegisterPage()),
    GetPage(name: AppRoutes.PROFILE_PHOTO, page: () => ProfilePhotoPage()),
    GetPage(name: AppRoutes.HOME, page: () => HomePage()),
    GetPage(name: AppRoutes.ACCOUNT_ALREADY_EXITS, page: () => AccountAlreadyExistsPage()),
    GetPage(name: AppRoutes.CONGRATULATIONS, page: () => CongratulationsPage()),
  ];
}
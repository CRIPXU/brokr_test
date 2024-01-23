import 'package:brokr_prueba/presentation/controllers/connectivity_controller.dart';
import 'package:brokr_prueba/presentation/controllers/global_controller.dart';
import 'package:brokr_prueba/presentation/page/no_internet_page.dart';
import 'package:brokr_prueba/presentation/routes/app_pages.dart';
import 'package:brokr_prueba/presentation/routes/app_routes.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // Íconos y texto oscuros
  ));
  await Get.putAsync(() async => ConnectivityController());
  await Get.putAsync(() async => GlobalController());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brokr Prueba',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFF675DFE),
          secondary: Colors.grey,
          brightness: Brightness.light,
          onBackground: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.white,
          background: Colors.white,
          surface: Colors.grey,
          onSurface: Colors.grey,
        ),
      ),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPage.pages,
      builder: (context, child) {
        ConnectivityController connectivityController = Get.find<ConnectivityController>();

        return StreamBuilder<ConnectivityResult>(
            stream: connectivityController.connectivityStream.stream,
            builder: (context, snapshot) {
              if (snapshot.data == ConnectivityResult.none) {
                return const NoInternetPage();
              } else {
                return child!;
              }
        });
      },
    );
  }
}

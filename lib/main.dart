import 'dart:io';

import 'package:brokr_prueba/presentation/routes/app_pages.dart';
import 'package:brokr_prueba/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


 class PostHttpOverrides extends HttpOverrides {
   @override
   HttpClient createHttpClient(context) {
     return super.createHttpClient(context)
       ..badCertificateCallback =
           (X509Certificate cert, String host, int port) => true;
   }
 }
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // Íconos y texto oscuros
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
    );
  }
}

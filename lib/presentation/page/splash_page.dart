import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:brokr_prueba/core/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.splash_logo,
              height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width / 2.4,
              filterQuality: FilterQuality.high),
        ],
      ),
      //backgroundColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 3000),
      splashIconSize: double.maxFinite,
      nextScreen: const LoginPage(),
    );
  }
}

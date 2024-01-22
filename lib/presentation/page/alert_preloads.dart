import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class AlertPreloads extends StatelessWidget {
  final SplashController _splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 8,
          backgroundColor: Colors.deepPurple.shade100,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
        ),
      ),
    );
  }
}


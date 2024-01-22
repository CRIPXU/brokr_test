import 'package:brokr_prueba/presentation/controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AlertPreloads extends StatelessWidget {
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
    return globalController.isLoading.value
      ? Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 8,
            backgroundColor: Colors.deepPurple.shade100,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
          ),
        ),
      ): const SizedBox.shrink();
    });
  }
}

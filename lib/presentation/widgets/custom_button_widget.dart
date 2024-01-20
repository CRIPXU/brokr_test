import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../core/utils/fonst_custom_theme.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({
    super.key,
    required this.onPressed,
    required this.emailController,
    required this.isLoading,
    required this.name,
  });

  final Function onPressed;
  final TextEditingController emailController;
  final RxBool isLoading;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
      child: ElevatedButton(
        onPressed: () async {
          onPressed(
            email: emailController.text,
            //password: passwordController.text,
            // device_name: deviceName,
          );
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: OutlinedBorder.lerp(
                ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
                5)),
        child: Obx(() {
          return isLoading.value
              ? CircularProgressIndicator(
                  strokeWidth: 4.5,
                  color: const Color(0xFF7772BC),
                  backgroundColor: Colors.deepPurple.shade200,
                )
              : Text(
                  name,
                  style: letter,
                  //   style: TextStyle(
                  //     color: Color(0xFF675DFE),
//
                  //   ),
                );
        }),
      ),
    );
  }
}

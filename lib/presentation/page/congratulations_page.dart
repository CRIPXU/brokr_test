import 'package:brokr_prueba/core/utils/images.dart';
import 'package:brokr_prueba/presentation/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/fonst_custom_theme.dart';
import '../widgets/text_color_button_widget.dart';

class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: Dimensions.MARGIN_SIZE_LARGE),
                  const SizedBox(height: Dimensions.MARGIN_SUPER_HIGTH),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_BIG_SMALL),
                  Image.asset(
                    Images.CONGRATULATIONS,
                    height: Dimensions.ICON_SIZE_AUTH_SMALL,
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  Text(
                    'Congratulations',
                    style: titleOver,
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_OVER_LARGE,right: Dimensions.PADDING_SIZE_DEFAULT_ADDRESS),
                      child: Text(
                          'Thank you for completing your details       now you can access the platform.',
                          style: letter,textAlign: TextAlign.center),
                    ),
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_BIG),
                  TextColorButtonWidget(colorButton: const Color(0xFF675DFE),colorText: Colors.white,onPressed: () {
                    Get.toNamed(AppRoutes.HOME);
                  }, text: 'Continue')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

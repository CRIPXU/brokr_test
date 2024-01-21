import 'package:brokr_prueba/core/utils/dimensions.dart';
import 'package:brokr_prueba/presentation/routes/app_pages.dart';
import 'package:brokr_prueba/presentation/routes/app_routes.dart';
import 'package:brokr_prueba/presentation/widgets/custom_button_widget.dart';
import 'package:brokr_prueba/presentation/widgets/icon_text_button-widget.dart';
import 'package:brokr_prueba/presentation/widgets/input_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/utils/fonst_custom_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                const SizedBox(height: Dimensions.MARGIN_SIZE_AUTH),
                Text('Log in or sing up', style: letterBold),
                const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                const Divider(thickness: 1),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                  InputIconWidget(
                    hintText: 'use@brokr.com',
                    controller: _emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
                  ),
                  CustomButtonWidget(
                    onPressed: () {

                    },
                    emailController: _emailController,
                    isLoading: RxBool(false),
                    name: 'Continue',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_BIG),
                  Stack(
                    alignment: const AlignmentDirectional( 0, Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                    children:  [
                      const Divider(thickness: 1,endIndent: 200),
                      const SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                      Text('Or', style: robotoRegular),
                      const SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                      const Divider(thickness: 1,indent: 200),
                    ],
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_LARGE),
                  IconTextButtonWidget(
                  onPressed: () {
                    Get.toNamed(AppRoutes.ACCOUNT_ALREADY_EXITS);
                  },
                      text: 'Continue with Google',),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

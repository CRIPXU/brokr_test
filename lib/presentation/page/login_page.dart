import 'package:brokr_prueba/core/utils/dimensions.dart';
import 'package:brokr_prueba/presentation/controllers/login_controller.dart';
import 'package:brokr_prueba/presentation/routes/app_routes.dart';
import 'package:brokr_prueba/presentation/widgets/custom_button_widget.dart';
import 'package:brokr_prueba/presentation/widgets/icon_text_button-widget.dart';
import 'package:brokr_prueba/presentation/widgets/input_icon_widget.dart';
import 'package:flutter/cupertino.dart';
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
  LoginController con = Get.put(LoginController());


  Future<void> _continueButtonPressed() async {
    bool emailExists = await con.checkEmailExists(con.emailController.text.trim());
    setState(() {
      con.loginCheck();
    });
    if (emailExists) {
      con.setShowPasswordInput(true);
    }
  }

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
                    controller: con.emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  if (con.showPasswordInput.value == true)
                    InputIconWidget(
                      hintText: '********',
                      controller: con.passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      labelText: 'Password',
                      icon: const Icon(Icons.remove_red_eye_outlined,
                          color: Color(0xFF5A6684)),
                    ),
                  Obx(
                    () => con.showPasswordInput.value
                        ? const SizedBox()
                        : Column(
                          children: [
                            CustomButtonWidget(
                                onPressed: _continueButtonPressed,
                               //    () async {
                               //  bool emailExists = await con.checkEmailExists(con.emailController.text.trim());
                               //  setState(() {
                               //    con.loginCheck();
                               //  });
                               //  if (emailExists) {
                               //    con.setShowPasswordInput(true);
                               //  }
                               //},
                                emailController: con.emailController,
                                isLoading: con.showPasswordInput,
                                name: 'Continue',
                              ),
                            const SizedBox(height: Dimensions.MARGIN_SIZE_BIG_LARGE),
                          ],
                        ),
                  ),
                  if (con.showPasswordInput.value == true)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                        Text('Forgot password?', style: robotoRegular, textAlign: TextAlign.end),
                        CustomButtonWidget(
                          onPressed: () {
                            con.login();
                          },
                          emailController: con.emailController,
                          isLoading: RxBool(false),
                          name: 'Login',
                        ),
                        const SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_LARGE),
                      ],
                    ),
                  Stack(
                    alignment: const AlignmentDirectional(
                        0, Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                    children: [
                      const Divider(thickness: 1, endIndent: 200),
                      const SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                      Text('Or', style: robotoRegular),
                      const SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                      const Divider(thickness: 1, indent: 200),
                    ],
                  ),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_LARGE),
                  IconTextButtonWidget(
                    onPressed: () {
                      Get.toNamed(AppRoutes.ACCOUNT_ALREADY_EXITS);
                    },
                    text: 'Continue with Google',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

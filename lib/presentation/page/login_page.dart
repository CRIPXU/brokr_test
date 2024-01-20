import 'package:brokr_prueba/core/utils/dimensions.dart';
import 'package:brokr_prueba/presentation/widgets/custom_button_widget.dart';
import 'package:brokr_prueba/presentation/widgets/icon_text_button-widget.dart';
import 'package:brokr_prueba/presentation/widgets/input_widget.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  Text('Log in or sing up', style: letterBold),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  const Divider(thickness: 1),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                  InputWidget(
                    hintText: 'use@brokr.com',
                    controller: _emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    guy: 'Email',
                  ),
                  CustomButtonWidget(
                    onPressed: () {},
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
                  IconTextButton(
                  onPressed: () {

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

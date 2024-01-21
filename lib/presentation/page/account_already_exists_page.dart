import 'package:brokr_prueba/core/utils/dimensions.dart';
import 'package:brokr_prueba/presentation/routes/app_routes.dart';
import 'package:brokr_prueba/presentation/widgets/icon_text_button-widget.dart';
import 'package:brokr_prueba/presentation/widgets/text_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/fonst_custom_theme.dart';
import '../widgets/circular_profile_pinture_widget.dart';

class AccountAlreadyExistsPage extends StatelessWidget {
  const AccountAlreadyExistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: Dimensions.MARGIN_SIZE_AUTH),
            Text('Account already exists', style: letterBold),
            const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
            const Divider(thickness: 1),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT,right: Dimensions.HOME_PAGE_PADDING),
                          child: Text(
                              'This account has already been registered with a social network, log in with another method',
                              style: letter,textAlign: TextAlign.justify),
                        ),
                      ),
                      const CircularProfilePintureWidget(),
                      const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                      Text('Luis Ordoñes', style: letterBold),
                      const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                      Text('user@brokr.com', style: letterBlack),
                      const SizedBox(height: Dimensions.MARGIN_SIZE_BIG_SMALL),
                      IconTextButtonWidget(onPressed: () {
                        Get.toNamed(AppRoutes.PROFILE_PHOTO);
                      }, text: 'Continue with Google'),
                      const SizedBox(height: Dimensions.MARGIN_SIZE_BIG_LARGE),
                      Stack(
                        alignment: const AlignmentDirectional( 0, Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                        children:  [
                          const Divider(thickness: 1,endIndent: 295),
                          const SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                          Text('Start with a different account', style: letterBlackBold),
                          const SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                          const Divider(thickness: 1,indent: 295),
                        ],
                      ),
                      const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                      TextButtonWidget(onPressed: () {
                        Get.back();
                      }, text: 'Back')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

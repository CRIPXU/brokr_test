import 'package:brokr_prueba/presentation/widgets/circular_profile_photo_widget.dart';
import 'package:flutter/material.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/fonst_custom_theme.dart';

class ProfilePhotoPage extends StatelessWidget {
  const ProfilePhotoPage({super.key});

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
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  Text('Profile photo', style: letterBold),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),
                  const Divider(thickness: 1),
                  const SizedBox(height: Dimensions.MARGIN_SIZE_SMALL),
                  CircularProfilePhotoWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

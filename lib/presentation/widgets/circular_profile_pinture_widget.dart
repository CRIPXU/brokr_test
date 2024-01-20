import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/images.dart';

class CircularProfilePhotoWidget extends StatelessWidget {
  // final  RegisterController controller;
  const CircularProfilePhotoWidget({
    super.key,
    //required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_LARGE),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundImage: AssetImage(Images.ICON_PERSON),
            radius: 50,
            backgroundColor: Colors.white,
            // backgroundColor: Color(0xFFCECECE),
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Titulo del dialogo'),
          content: Text('Contenido del dialogo'),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('cerrar'),
            ),
          ],
        );
      },
    );
  }
}

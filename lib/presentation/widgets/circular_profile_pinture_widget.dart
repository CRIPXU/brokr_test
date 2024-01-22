import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/images.dart';

class CircularProfilePintureWidget extends StatelessWidget {
  // final  RegisterController controller;
  const CircularProfilePintureWidget({
    super.key, //required this.controller
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
          title: const Text('Titulo del dialogo'),
          content: const Text('Contenido del dialogo'),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('cerrar'),
            ),
          ],
        );
      },
    );
  }
}

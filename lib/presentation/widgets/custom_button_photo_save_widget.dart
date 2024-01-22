import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../core/utils/fonst_custom_theme.dart';

class CustomButtonPhotoSaveWidget extends StatelessWidget {
  CustomButtonPhotoSaveWidget({
    Key? key,
    required this.onPressed,
    required this.isLoading,
    required this.name,
    required this.hasPhoto,
  }) : super(key: key);

  final Function onPressed;
  final RxBool isLoading;
  final String name;
  final bool hasPhoto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165, height: 45,
      //margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 31),
      child: ElevatedButton(
        onPressed: () async {
          // Verificar si hay una foto antes de enviar al servidor
          if (hasPhoto) {
            // Llamar a la función para enviar datos al servidor
            _sendDataToServer();
          } else {
            // Mostrar un mensaje de error o realizar alguna acción adicional
            // si no se ha agregado una foto
            print('Debes agregar una foto antes de enviar al servidor');
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          fixedSize: const Size(25, 25)
        ),
        child: Obx(() {
          return isLoading.value
              ? FittedBox(
            child: CircularProgressIndicator(
            strokeWidth: 4.5,
            color: const Color(0xFF7772BC),
            backgroundColor: Colors.deepPurple.shade200))
              : Text(name, style: letter);
        }),
      ),
    );
  }

  // Función para enviar datos al servidor
  void _sendDataToServer() {
    // Lógica para enviar datos al servidor
    onPressed();
  }
}

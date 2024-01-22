import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetMaterialController {
  TextEditingController emailController = TextEditingController();

  void login() async {
    String email = emailController.text.trim();
    
    print('===>Email: $email');
    
    if (isValidForm(email)) {
      
    }  
  }
}

bool isValidForm (String email) {
  if (email.isEmpty) {
    Get.snackbar('Formulario no valido', 'El email no es valido');
    return false;
  }
  return true;
}
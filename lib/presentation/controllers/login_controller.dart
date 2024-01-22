import 'package:brokr_prueba/core/model/language_model.dart';
import 'package:brokr_prueba/data/remote/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetMaterialController {
  TextEditingController emailController = TextEditingController();
  final ApiService _apiService = ApiService();
  RxList<Language> languages = <Language>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchLanguages();
  }

  Future<void> fetchLanguages() async {
    try {
      final List<Language> languageList = await _apiService.fetchLanguages();
      languages.assignAll(languageList);
      print('Languages loaded: ${languages.length}');
    } catch (e) {
      print('Error loading languages: $e');
    }
  }

  void login() {
    String email = emailController.text.trim();
    print('Email: $email');

    if (isValidForm(email)) {
      // Continuar con el proceso de inicio de sesión
    }
  }

  bool isValidForm(String email) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no válido', 'El email no es válido');
      return false;
    }
    return true;
  }
}


bool isValidForm (String email) {
  if (email.isEmpty) {
    Get.snackbar('Formulario no valido', 'El email no es valido');
    return false;
  }
  return true;
}
import 'package:brokr_prueba/core/model/language_model.dart';
import 'package:brokr_prueba/data/remote/api_service.dart';
import 'package:brokr_prueba/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetMaterialController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ApiService _apiService = ApiService();
  RxList<Language> languages = <Language>[].obs;
  RxBool showPasswordInput = RxBool(false);
  RxBool isValidEmail = RxBool(false);


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    String deviceLanguage = Get.deviceLocale?.languageCode ?? 'en';
    fetchLanguages(deviceLanguage);
  }

  Future<void> fetchLanguages(String deviceLanguage) async {
    try {
      final List<Language> languageList = await _apiService.fetchLanguages();
      languages.assignAll(languageList);
      print('Languages loaded: ${languages.length}');
    } catch (e) {
      print('Error loading languages: $e');
    }
  }

  void setShowPasswordInput(bool value) {
    showPasswordInput.value = value;
  }

  void login() {
    String email = emailController.text.trim();

    if (isValidForm(email, passwordController.text.trim())) {
      setShowPasswordInput(true);
    }
  }

  void loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: $email');
    print('Password: $password');


    if (isValidForm(email, password)) {
      try {
        String languageCode = languages.isNotEmpty ? languages.first.code : 'en';

        // Enviar la solicitud al servidor
        await _apiService.loginUser(
          email: email,
          password: password,
          os: 'android', // Cambia según tu lógica
          type: 'mobile', // Cambia según tu lógica
          fcmToken: 'DFGKNODFIJO34U89FGKNO', // Obtén el token de FCM del dispositivo
          languageCode: languageCode,
        );

        // Continuar con la navegación a la siguiente página
        Get.toNamed(AppRoutes.HOME); // Reemplaza '/next_page' con la ruta correcta
      } catch (e) {
        print('Error logging in: $e');
      }
    }
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no válido', 'El email no es válido');
      isValidEmail.value = false;
      return false;
    }
    isValidEmail.value = true;
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
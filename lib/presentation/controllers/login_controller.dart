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

  Future<bool> checkEmailExists(String email) async {
    try {
      return await _apiService.checkEmailExists(email);
    } catch (e) {
      print('Error checking email existence: $e');
      return false;
    }
  }

  void setShowPasswordInput(bool value) {
    showPasswordInput.value = value;
  }

  void login() async {
    String email = emailController.text.trim();

    if (isValidForm(email)) {
      bool emailExists = await checkEmailExists(email);
      print('====================>emailExists: $emailExists');
      if (emailExists) {
        setShowPasswordInput(true);
      } else {
        Get.snackbar(
          'Correo no registrado',
          'El correo electrónico no está registrado en el servidor',
        );
      }
    }
  }


  bool isValidForm(String email) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no válido', 'El email no es válido');
     // isValidEmail.value = false;
      return false;
    }
    return true;
  }

  void loginWithSocial() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: $email');
    print('Password: $password');

    if (isValidForm(email, )) {
      try {
        String languageCode =
            languages.isNotEmpty ? languages.first.code : 'en';

        // Enviar la solicitud al servidor
        await _apiService.loginWithSocial(
          email: email,
          password: password,
          os: 'android',
          // Cambia según tu lógica
          type: 'mobile',
          // Cambia según tu lógica
          fcmToken: 'DFGKNODFIJO34U89FGKNO',
          // Obtén el token de FCM del dispositivo
          language: languageCode,
        );

        // Continuar con la navegación a la siguiente página
        Get.toNamed(
            AppRoutes.HOME); // Reemplaza '/next_page' con la ruta correcta
      } catch (e) {
        print('Error logging in: $e');
      }
    }
  }
 //     isValidEmail.value = false;

}



import 'package:brokr_prueba/core/model/language_model.dart';
import 'package:brokr_prueba/data/remote/api_service.dart';
import 'package:brokr_prueba/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'global_controller.dart';

class LoginController extends GetMaterialController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalController globalController = Get.find();
  final ApiService _apiService = ApiService();
  RxList<Language> languages = <Language>[].obs;
  RxBool showBottonLogin = RxBool(false);
  RxBool showLoginInput = RxBool(false);
  RxBool isValidEmail = RxBool(false);
  RxBool isLoading = RxBool(false);


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

  void setShowButtonLogin(bool value) {
    showBottonLogin.value = value;
  }

 Future<void> loginCheck() async {
    String email = emailController.text.trim();

    if (isValidEmailCheck(email))  {
      bool emailExists = await checkEmailExists(email);
      print('====================>emailExists: $emailExists');
      if (emailExists) {
        setShowButtonLogin(true);
      } else {
        Get.snackbar(
          'Correo no registrado',
          'El correo electrónico no está registrado en el servidor',
        );
      }
    };
  }


  bool isValidEmailCheck(String email) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no válido', 'El email no es válido');
      return false;
    }
    return true;
  }


  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: $email');
    print('Password: $password');

    // Mostrar la pantalla de carga
    globalController.isLoading.value = true;

    if (isValidEmailPasswordCheck(email, password))   {
      try {
        String languageCode = languages.isNotEmpty ? languages.first.code : 'en';

        String response = await _apiService.login(
          email: email,
          password: password,
          os: 'android',
          type: 'guest',
          fcmToken: 'DFGKNODFIJO34U89FGKNO',
          language: 'es',
        );

        // Verificar la respuesta del servidor
        if (response == 'success') {
          // Inicio de sesión exitoso
          print('Token: ${_apiService.getAuthToken()}');
          Get.toNamed(AppRoutes.HOME);
        } else if (response == 'error' && response == 'Invalid credentials') {
          // Contraseña incorrecta
          Get.snackbar('Error', 'Contraseña incorrecta');
        } else {
          // Otro tipo de error
          Get.snackbar('Error', 'Error al iniciar sesión');
        }
      } catch (e) {
        print('Error logging in: $e');
      } finally {
        // Ocultar la pantalla de carga
        globalController.isLoading.value = false;
      }
    }
  }


  bool isValidEmailPasswordCheck(String email, String password) {
    if (email.isEmpty && password.isEmpty) {
      Get.snackbar('Formulario no válido', 'El Password no es válido');
      return false;
    }
    return true;
  }

  void setShowLoginInput(bool value) {
    showLoginInput.value = value;
  }
}



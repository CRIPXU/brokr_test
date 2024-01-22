import 'dart:convert';

import 'package:brokr_prueba/core/model/language_model.dart';
import 'package:brokr_prueba/core/utils/app_constans.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService extends GetConnect {
  Uri uriLanguages = Uri.https(AppConstants.BASE_URL, AppConstants.LANGUAGE, {'q': '{http}'});
  Uri uriLogin = Uri.https(AppConstants.BASE_URL, AppConstants.LOGIN_URI, {'q': '{http}'});
  //Uri uriLogin = Uri.parse('https://staging.brokr.com/api/api/auth/login');
  Uri uriLoginCheckEmail = Uri.https(AppConstants.BASE_URL, AppConstants.CHECK_EMAIL_URI, {'q': '{http}'});
  String? _authToken;

  Future<List<Language>> fetchLanguages() async {
    print(uriLanguages);
    final response = await get(
      uriLanguages,
      headers: {
        'Authorization': 'Bearer 4|HpKlxwsfUCcvcJnCGql5nWM7WdkrJwZTn98IDgN8',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body)['data'];

      if (responseData is List) {
        return responseData.map((item) => Language.fromJson(item)).toList();
      } else {
        throw Exception('Data is not a List');
      }
    } else {
      throw Exception('Failed to load languages');
    }
  }

  Future<String> login({
    required String email,
    required String password,
    required String os,
    required String type,
    required String fcmToken,
    required String language,
  }) async {
    try {
      final Map<String, String> requestData = {
        'email': email,
        'password': password,
        'os': os,
        'type': type,
        'fcm_token': fcmToken,
        'language': language,
      };

      final response = await post(
        uriLogin,
        body: requestData,
        headers: {
          'Authorization': 'Bearer 4|HpKlxwsfUCcvcJnCGql5nWM7WdkrJwZTn98IDgN8',
          //'Content-Type': 'application/json',
        },
      );
      print('=======================>uriLogin:   $uriLogin');
      if (response.statusCode == 200) {
        final dynamic responseData = jsonDecode(response.body)['data'];
        final Map<String, dynamic> userData = responseData['customer'];
        final String token = responseData['token'];
        print('Login successful: $userData');
        print('Token: $token');
        await saveToken(token);
        return 'success';
      } else if (response.statusCode == 422) {
        // Error de validación del lado del servidor
        Map<String, dynamic> errorData = jsonDecode(response.body);
        String errorMessage = errorData['message'] ?? 'Error de validación';
        Get.snackbar('Error', errorMessage);
        return 'error';
      } else if(response.statusCode == 401) {
        Get.snackbar('Error', 'Contraseña incorrecta');
        return 'error';
      }else{
        Get.snackbar('Error', 'Error al iniciar sesión');
        return 'error';
      }
    } catch (e) {
      print('Error logging in: $e');
      rethrow;
    }
  }



  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', token);
    _authToken = token;
  }

  Future<String?> getAuthToken() async {
    if (_authToken != null) {
      // Si el token ya está en memoria, devuélvelo directamente
      return _authToken;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _authToken = prefs.getString('auth_token');
    return _authToken;
  }


  Future<bool> checkEmailExists(String email) async {
    try {
      final response = await post(
        uriLoginCheckEmail,
        body: jsonEncode({'email': email}),
        headers: {
          'Authorization': 'Bearer 4|HpKlxwsfUCcvcJnCGql5nWM7WdkrJwZTn98IDgN8',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final dynamic responseData = jsonDecode(response.body);
        print('===========================>responsesData:    $responseData');

        return responseData['status'] == "success";
      }  else {
        return false;
      }
    } catch (e) {
      print('Error al verificar el correo electrónico: $e');
      throw e;
    }
  }
}




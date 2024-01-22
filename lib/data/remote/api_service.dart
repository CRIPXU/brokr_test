import 'dart:convert';

import 'package:brokr_prueba/core/model/language_model.dart';
import 'package:brokr_prueba/core/utils/app_constans.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService extends GetConnect {
  Uri uriLanguages = Uri.https(
      AppConstants.BASE_URL, AppConstants.LANGUAGE, {'q': '{http}'});
  Uri uriLoginUserWithSocial = Uri.https(
      AppConstants.BASE_URL, AppConstants.LOGIN_WITH_SOCIAL, {'q': '{http}'});
  Uri uriLoginCheckEmail = Uri.https(
      AppConstants.BASE_URL, AppConstants.CHECK_EMAIL_URI, {'q': '{http}'});

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

  Future<void> loginWithSocial({
    required String email,
    required String password,
    required String os,
    required String type,
    required String fcmToken,
    required String language,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'email': email,
        'password': password,
        'os': os,
        'type': type,
        'fcm_token': fcmToken,
        'language': language,
      };

      final response = await post(
        uriLoginUserWithSocial,
        body: requestData,
        headers: {
          'Authorization': 'Bearer HpKlxwsfUCcvcJnCGql5nWM7WdkrJwZTn98IDgN8',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final dynamic responseData = jsonDecode(response.body)['data'];

        final Map<String, dynamic> userData = responseData['customer'];
        final String token = responseData['token'];

        await saveToken(token);

        print('Login successful: $userData');
        print('Token: $token');
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login: $e');
      rethrow;
    }
  }

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', token);
  }

  Future<String?> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
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




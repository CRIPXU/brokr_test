import 'dart:convert';

import 'package:brokr_prueba/core/model/language_model.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart';

class ApiService extends GetConnect {
  Uri uri = Uri.https('staging.brokr.com','/api/api/languages',{'q': '{http}'});

  Future<List<Language>> fetchLanguages() async {
    print(uri);
    final response = await get(
        uri,
        headers: {
          'Authorization': 'Bearer HpKlxwsfUCcvcJnCGql5nWM7WdkrJwZTn98IDgN8',
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

  loginUser({required String email, required String password, required String os, required String type, required String fcmToken, required String languageCode}) {}
}

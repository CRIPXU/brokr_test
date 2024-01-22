class LoginRequest {
  final String email;
  final String password;
  final String os;
  final String type;
  final String fcmToken;
  final String languageCode;

  LoginRequest({
    required this.email,
    required this.password,
    required this.os,
    required this.type,
    required this.fcmToken,
    required this.languageCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'os': os,
      'type': type,
      'fcm_token': fcmToken,
      'language': languageCode,
    };
  }
}

class LoginResponse {
  final Map<String, dynamic> customer;
  final String token;

  LoginResponse({required this.customer, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      customer: json['customer'],
      token: json['token'],
    );
  }
}

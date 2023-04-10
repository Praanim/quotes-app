import 'dart:convert';

class UserSession {
  final String email;
  final String login;
  final String userToken;

  UserSession({
    required this.email,
    required this.login,
    required this.userToken,
  });

  static Map<String, dynamic> reqBody(String email, password) {
    return {
      'user': {"login": email, "password": password}
    };
  }

  factory UserSession.fromMap(Map<String, dynamic> map) {
    return UserSession(
      email: map['email'] ?? '',
      login: map['login'] ?? '',
      userToken: map['User-Token'],
    );
  }

  String toJson(String email, String password) =>
      json.encode(reqBody(email, password));

  factory UserSession.fromJson(String source) =>
      UserSession.fromMap(json.decode(source));
}

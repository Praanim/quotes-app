import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:qoute_app/api/api.dart';
import 'package:qoute_app/core/failure.dart';
import 'package:qoute_app/core/type_defs.dart';
import 'package:qoute_app/features/auth/data/models/session_model.dart';

class AuthRepository {
  final Api api;
  final String _authToken = "Token token=79f53b630e11248ddb1b4baaa85574b1";
  AuthRepository({
    required this.api,
  });

  FutureEither<UserSession> login(
      {required String email, required String password}) async {
    try {
      Response response = await api.sendRequest.post('/session',
          data: UserSession.reqBody(email, password),
          options: Options(headers: {
            "authorization": _authToken,
          }));

      final sessionData = UserSession.fromMap(response.data);
      return right(sessionData);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}

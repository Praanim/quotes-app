import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_app/core/failure.dart';
import 'package:qoute_app/features/auth/data/models/session_model.dart';
import 'package:qoute_app/features/auth/data/services/auth_repository.dart';

part 'user_session_state.dart';

class UserSessionCubit extends Cubit<UserSessionState> {
  final AuthRepository _authRepository;
  UserSessionCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(UserSessionInitial());

  void login({
    required String email,
    required String password,
  }) async {
    final userSessionData =
        await _authRepository.login(email: email, password: password);
    userSessionData.fold((failure) => emit(SessionError(failure: failure)),
        (userSession) => emit(SessionActive(userSession: userSession)));
  }
}

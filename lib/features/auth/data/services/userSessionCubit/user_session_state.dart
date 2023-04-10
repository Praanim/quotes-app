part of 'user_session_cubit.dart';

abstract class UserSessionState {}

class UserSessionInitial extends UserSessionState {}

class SessionActive extends UserSessionState {
  final UserSession userSession;
  SessionActive({
    required this.userSession,
  });
}

class SessionDown extends UserSessionState {}

class SessionError extends UserSessionState {
  final Failure failure;
  SessionError({
    required this.failure,
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_app/api/api.dart';
import 'package:qoute_app/core/theme/pallete.dart';
import 'package:qoute_app/features/auth/data/services/auth_repository.dart';
import 'package:qoute_app/features/auth/data/services/userSessionCubit/user_session_cubit.dart';
import 'package:qoute_app/features/auth/presentation/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes App',
      theme: CustomAppTheme().customLightTheme,
      home: RepositoryProvider(
        create: (context) => AuthRepository(api: Api()),
        child: BlocProvider(
          create: (c) =>
              UserSessionCubit(authRepository: c.read<AuthRepository>()),
          child: const LoginScreen(),
        ),
      ),
    );
  }
}

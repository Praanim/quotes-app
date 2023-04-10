import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_app/common/colors.dart';
import 'package:qoute_app/features/auth/data/services/userSessionCubit/user_session_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _imageUrl = 'assets/images/login.webp';
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<UserSessionCubit, UserSessionState>(
      listener: (context, state) {
        if (state is SessionActive) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text("Hello world"),
              ),
            ),
          ));
        } else if (state is SessionError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.failure.message)));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  _imageUrl,
                  height: size.height * 0.35,
                  width: size.width,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Welcome ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: AppColors.secondaryAppColor),
                            children: [
                              TextSpan(
                                  text: "Back!",
                                  style:
                                      Theme.of(context).textTheme.headlineLarge)
                            ]),
                      ),
                      const Text("Login",
                          style: TextStyle(
                              color: AppColors.secondaryAppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        fieldController: _emailController,
                        hintText: "Email",
                        leadingIcon: const Icon(
                          Icons.person,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        fieldController: _passwordController,
                        hintText: "Password",
                        leadingIcon: const Icon(
                          Icons.lock,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: AppColors.mainAppColor),
                          onPressed: () {
                            //login feature to be added
                            context.read<UserSessionCubit>().login(
                                email: _emailController.text.trim(),
                                password: _passwordController.text);
                          },
                          icon: const Icon(Icons.login),
                          label: const Text(
                            "Login",
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController fieldController,
    required this.hintText,
    this.leadingIcon,
  }) : _fieldController = fieldController;

  final TextEditingController _fieldController;
  final String hintText;
  final Icon? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _fieldController,
      cursorColor: AppColors.secondaryAppColor,
      style: const TextStyle(color: AppColors.whiteColor),
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.abc),
          suffixIconColor: Colors.white,
          contentPadding: const EdgeInsets.all(8),
          hintStyle: const TextStyle(color: AppColors.whiteColor),
          filled: true,
          fillColor: AppColors.mainAppColor,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: hintText,
          icon: leadingIcon),
    );
  }
}

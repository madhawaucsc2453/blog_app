import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => SignUpPage());
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 30, color: AppPallete.whiteColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthField(
                  hint: "Name",
                  controller: nameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthField(
                  hint: "Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthField(
                  hint: "Password",
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                AuthGradientButton(
                  onPressed: () {
                    formKey.currentState!.validate()
                        ? context.read<AuthBloc>().add(AuthSignUp(
                              email: emailController.text.trim(),
                              name: nameController.text.trim(),
                              password: passwordController.text.trim(),
                            ))
                        : null;
                  },
                  label: "Sign Up",
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, LogInPage.route());
                  },
                  child: RichText(
                      text: TextSpan(
                          text: "Already have an account? ",
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                        TextSpan(
                            text: "Sign In",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: AppPallete.gradient2,
                                    fontWeight: FontWeight.bold))
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

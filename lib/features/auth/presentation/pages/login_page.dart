import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/pages/signup_page.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  static route() => MaterialPageRoute(builder: (context) => LogInPage());
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 30, color: AppPallete.whiteColor),
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
                  label: "Log In",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, SignUpPage.route());
                  },
                  child: RichText(
                      text: TextSpan(
                          text: "Don't have an account? ",
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                        TextSpan(
                            text: "Sign Up",
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

import 'package:app/app/core/constants.dart';
import 'package:app/widgets/button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Text("Start", style: AppConstants.texts.headline),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam urna libero, pharetra eu malesuada a, tincidunt et erat. Fusce ut urna sapien.",
                    style: AppConstants.texts.paragraph),
                const SizedBox(height: 40),
                AppButton(
                    text: "Login",
                    onTap: () async {
                      Navigator.pushNamed(context, "/auth/login");
                    },
                    type: ButtonType.primary),
                const SizedBox(height: 10),
                AppButton(
                    text: "Register",
                    onTap: () async {
                      print("tapped");
                    },
                    type: ButtonType.secondary)
              ],
            ),
          ),
        ));
  }
}

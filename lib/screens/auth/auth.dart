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
                Text("Best location app yet. Save, organize and share locations.", style: AppConstants.texts.paragraph),
                const SizedBox(height: 40),
                AppButton(
                    text: "Login", onTap: () => Navigator.pushNamed(context, "/auth/login"), type: ButtonType.primary),
                const SizedBox(height: 10),
                AppButton(
                    text: "Register",
                    onTap: () => Navigator.pushNamed(context, "/auth/register"),
                    type: ButtonType.secondary)
              ],
            ),
          ),
        ));
  }
}

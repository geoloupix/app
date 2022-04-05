import 'package:app/app/core/constants.dart';
import 'package:app/widgets/button.dart';
import 'package:flutter/material.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({Key? key}) : super(key: key);

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    Text("Login", style: AppConstants.texts.headline),
                    const SizedBox(height: 40),
                    AppButton(
                        text: "Login",
                        onTap: () async {
                          print("tapped");
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
            ),
            Positioned(
              top: 12,
              left: 12,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_rounded, color: AppConstants.colors.grey, size: 20),
                    const SizedBox(width: 8),
                    Text("Back", style: AppConstants.texts.paragraph)
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

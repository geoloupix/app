import 'package:app/app/core/constants.dart';
import 'package:app/app/core/global.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/text_input.dart';
import 'package:flutter/material.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({Key? key}) : super(key: key);

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  final formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";

  void submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final response = await authController.login(username, password);
      print("response !");
      print(response);
    }
  }

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
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            AppTextInput(
                              hint: "Username",
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Field required";
                                }
                              },
                              onSaved: (v) {
                                setState(() {
                                  username = v!;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            AppTextInput(
                              hint: "Password",
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Field required";
                                }
                              },
                              onSaved: (v) {
                                setState(() {
                                  password = v!;
                                });
                              },
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ],
                        )),
                    const SizedBox(height: 10),
                    AppButton(text: "Let's go!", onTap: submit, type: ButtonType.primary),
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

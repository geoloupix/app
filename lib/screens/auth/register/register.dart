import 'package:geoloupix/app/core/constants.dart';
import 'package:geoloupix/app/core/global.dart';
import 'package:geoloupix/widgets/button.dart';
import 'package:geoloupix/widgets/text_input.dart';
import 'package:flutter/material.dart';

class AuthRegisterScreen extends StatefulWidget {
  const AuthRegisterScreen({Key? key}) : super(key: key);

  @override
  State<AuthRegisterScreen> createState() => _AuthRegisterScreenState();
}

class _AuthRegisterScreenState extends State<AuthRegisterScreen> {
  final formKey = GlobalKey<FormState>();
  String username = "";
  String email = "";
  String password = "";
  String? error;

  void submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final response = await authController.register(email: email, username: username, password: password);
      if (response != null) {
        setState(() {
          error = response;
        });
      } else {
        Navigator.pushReplacementNamed(context, "/home");
      }
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
                    Text("Register", style: AppConstants.texts.headline),
                    const SizedBox(height: 40),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            AppTextInput(
                              hint: "Email",
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Field required";
                                }
                                final regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                                if (!regex.hasMatch(v)) {
                                  return "Invalid email format";
                                }
                                return null;
                              },
                              onSaved: (v) {
                                setState(() {
                                  email = v!;
                                });
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            AppTextInput(
                              hint: "Username",
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Field required";
                                }
                                if (v.length > 100) {
                                  return "Username too long";
                                }
                                return null;
                              },
                              onSaved: (v) {
                                setState(() {
                                  username = v!;
                                });
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            AppTextInput(
                              hint: "Password",
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Field required";
                                }
                                if (v.length < 8) {
                                  return "Password too short";
                                }
                                setState(() {
                                  password = v;
                                });
                                return null;
                              },
                              onSaved: (v) {
                                setState(() {
                                  password = v!;
                                });
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(height: 10),
                            AppTextInput(
                              hint: "Confirm password",
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Field required";
                                }
                                if (password != v) {
                                  return "Password don't match";
                                }
                                return null;
                              },
                              onSaved: (v) {
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ],
                        )),
                    const SizedBox(height: 10),
                    AppButton(text: "Let's go!", onTap: submit, type: ButtonType.primary),
                    if (error != null)
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration:
                                BoxDecoration(color: AppConstants.colors.red, borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.all(6),
                            child: Text(error!,
                                style: AppConstants.texts.paragraph.copyWith(color: AppConstants.colors.white)),
                          )
                        ],
                      )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                    color: AppConstants.colors.white,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back_rounded, color: AppConstants.colors.grey, size: 20),
                              const SizedBox(width: 8),
                              Text("Back", style: AppConstants.texts.paragraph)
                            ],
                          ),
                        ),
                      ],
                    ))),
          ],
        ));
  }
}

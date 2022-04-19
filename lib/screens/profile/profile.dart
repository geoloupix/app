import 'package:app/app/core/constants.dart';
import 'package:app/app/core/global.dart';
import 'package:app/widgets/button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 100),
                      Text(authController.user!.username, style: AppConstants.texts.headline),
                      Text(authController.user!.email, style: AppConstants.texts.paragraph),
                      const SizedBox(height: 40),
                      AppButton(
                          text: "Log out",
                          onTap: () async {
                            await authController.logout();
                            Navigator.pushReplacementNamed(context, "/loading");
                          },
                          type: ButtonType.danger),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                print("delete account");
                              },
                              child: Text(
                                "Delete account",
                                style: AppConstants.texts.paragraph.copyWith(color: AppConstants.colors.red),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_rounded, color: AppConstants.colors.grey, size: 20),
                                const SizedBox(width: 8),
                                Text("Profile", style: AppConstants.texts.paragraph)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("update");
                                },
                                child: Text("Update",
                                    style: AppConstants.texts.paragraph
                                        .copyWith(color: AppConstants.colors.primary, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ))),
            ],
          ),
        ));
  }
}

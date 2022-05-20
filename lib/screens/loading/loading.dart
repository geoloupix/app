import 'package:geoloupix/app/core/constants.dart';
import 'package:geoloupix/app/core/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    auth();
  }

  Future<void> auth() async {
    final hasUser = await authController.load();
    if (!hasUser) {
      Navigator.pushReplacementNamed(context, "/auth");
    } else {
      await locationController.getLocations();
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.colors.primary,
        body: Center(child: SvgPicture.asset("assets/images/logo.svg", color: AppConstants.colors.white)));
  }
}

import 'package:geoloupix/app/core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "loading",
      onGenerateRoute: AppRouter.onGenerateRoute,
      themeMode: ThemeMode.light,
    );
  }
}

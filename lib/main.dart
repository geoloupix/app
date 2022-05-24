import 'dart:io';

import 'package:geoloupix/app/core/kvs.dart';
import 'package:geoloupix/widgets/app.dart';
import 'package:flutter/material.dart';

const bool reset = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Dev purpose only
  if (reset) {
    await KVS.deleteAll();
    exit(0);
  }
  runApp(const App());
}

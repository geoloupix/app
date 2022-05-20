import 'package:geoloupix/app/controllers/auth.dart';
import 'package:geoloupix/app/controllers/location.dart';

final AuthController authController = AuthController();
final LocationController locationController = LocationController(authController);

// TODO: Add cached locations and categories
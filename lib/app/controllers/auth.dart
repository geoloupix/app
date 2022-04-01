import 'dart:convert';

import 'package:app/app/controllers/api.dart';
import 'package:app/app/models/user.dart';
import 'package:app/app/utils/kvs.dart';

class AuthController {
  AuthController();

  User? user;
  late final ApiController api = ApiController(this);

  Future<String?> login(String username, String password) async {
    final response = await api.login({"username": username, "password": password});
    if (response == null) return null;
    if (response["error"] != null) return response["error"];
    user = User(
        id: response["id"]!,
        username: response["username"]!,
        email: response["email"]!,
        password: response["password"]!);
    await _save();
    return null;
  }

  Future<String?> register(String username, String password, String passwordConfirmation) async {}

  Future<void> _save() async {
    if (user == null) return;

    await KVS.write(
        key: "auth",
        value: json.encode(<String, String>{
          "id": user!.id,
          "username": user!.username,
          "email": user!.email,
          "password": user!.password
        }));
  }

  Future<bool> _load() async {
    final data = await KVS.read(key: "auth");
    if (data == null) false;
    final Map<String, String> map = json.decode(data!);
    user = User(id: map["id"]!, username: map["username"]!, email: map["email"]!, password: map["password"]!);
    return true;
  }
}

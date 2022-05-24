import 'dart:convert';

import 'package:geoloupix/app/controllers/api.dart';
import 'package:geoloupix/app/models/user.dart';
import 'package:geoloupix/app/core/kvs.dart';

class AuthController {
  AuthController();

  User? user;
  late final ApiController api = ApiController(this);

  Future<String?> login(String username, String password) async {
    final response = await api.login({"username": username, "password": password});
    if (response["error"] != null) return response["error"];
    user = User(
        id: response["uuid"]!, username: response["username"]!, email: response["email"]!, token: response["token"]!);
    await _save();
    return null;
  }

  Future<String?> register({required String email, required String username, required String password}) async {
    final response = await api.register({"username": username, "password": password, "email": email});
    if (response["error"] != null) return response["error"];
    user = User(
        id: response["uuid"]!, username: response["username"]!, email: response["email"]!, token: response["token"]!);
    await _save();
    return null;
  }

  Future<void> _save() async {
    if (user == null) return;

    await KVS.write(
        key: "auth",
        value: json.encode(
            <String, String>{"id": user!.id, "username": user!.username, "email": user!.email, "token": user!.token}));
  }

  Future<bool> load() async {
    final data = await KVS.read(key: "auth");
    if (data == null) return false;
    final Map map = json.decode(data);
    user = User(id: map["id"]!, username: map["username"]!, email: map["email"]!, token: map["token"]!);
    return true;
  }

  Future<void> logout() async {
    user = null;
    await KVS.deleteAll();
  }
}

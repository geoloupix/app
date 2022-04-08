import 'package:app/app/controllers/auth.dart';

import 'package:dio/dio.dart';

class ApiController {
  final AuthController _auth;

  ApiController(this._auth);

  final Dio _dio = Dio();
  final String _rootUrl = "https://geoloupix.fr/api";

  Future<Map<String, dynamic>?> login(Map<String, String> parameters) async {
    try {
      final response = await _dio.post<Map<String, String>>("$_rootUrl/auth/login", data: parameters);
      return response.data;
    } catch (e) {
      if (e is DioError) {
        return {"error": e.message};
      }
      return {"error": "$e"};
    }
  }

  Future<Map<String, dynamic>?> register(Map<String, String> parameters) async {
    try {
      final response = await _dio.post<Map<String, String>>("$_rootUrl/auth/register", data: parameters);
      return response.data;
    } catch (e) {
      if (e is DioError) {
        return {"error": e.message};
      }
      return {"error": "$e"};
    }
  }
}

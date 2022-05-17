import 'package:app/app/controllers/auth.dart';

import 'package:dio/dio.dart';

class ApiController {
  final AuthController _auth;

  ApiController(this._auth);

  Dio get _dio => Dio(BaseOptions(headers: {
        "X-Token": "${_auth.user?.token}",
      }));
  final String _rootUrl = "https://geoloupix.fr/api";

  Future<Map<String, dynamic>> login(Map<String, String> parameters) async {
    try {
      final response = await _dio.post("$_rootUrl/login", data: parameters);
      return response.data;
    } catch (e) {
      if (e is DioError) {
        return {"error": e.response?.data["message"] ?? e.message};
      }
      return {"error": "$e"};
    }
  }

  Future<Map<String, dynamic>> register(Map<String, String> parameters) async {
    try {
      final response = await _dio.post("$_rootUrl/register", data: parameters);
      return response.data;
    } catch (e) {
      if (e is DioError) {
        return {"error": e.response?.data["message"] ?? e.message};
      }
      return {"error": "$e"};
    }
  }

  Future<Map<String, dynamic>> getFoldersAndLocations(Map<String, String> parameters) async {
    try {
      final response = await _dio.get(
        "$_rootUrl/folders",
        queryParameters: parameters,
      );
      return response.data;
    } catch (e) {
      return {"error": "$e"};
    }
  }

  Future<Map<String, dynamic>> getLocations(Map<String, String> parameters) async {
    try {
      final response = await _dio.get(
        "$_rootUrl/locations",
        queryParameters: parameters,
      );
      return {"locations": response.data};
    } catch (e) {
      return {"error": "$e"};
    }
  }
}

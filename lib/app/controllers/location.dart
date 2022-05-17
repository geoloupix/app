import 'package:app/app/controllers/api.dart';
import 'package:app/app/controllers/auth.dart';
import 'package:app/app/models/category.dart';
import 'package:app/app/models/location.dart';
import 'package:latlong2/latlong.dart';

class _GetRes {
  final String? error;
  final List<Location> locations;
  final List<Category> categories;

  const _GetRes({required this.error, this.locations = const [], this.categories = const []});
}

class LocationController {
  final AuthController _auth;
  LocationController(this._auth);

  late final ApiController api = ApiController(_auth);

  Future<_GetRes> getAll({String? folderId}) async {
    final response = await api.getFolders(folderId == null ? {} : {"folder_id": folderId});
    if (response["error"] != null) return _GetRes(error: response["error"]);
    final categories = (response["folders"] as List<dynamic>)
        .map((e) => Category(id: e["id"], name: e["name"], userId: e["user_id"], parentId: e["parent_id"]))
        .toList();
    final locations = (response["locations"] as List<dynamic>)
        .map((e) => Location(
            id: e["id"],
            name: e["name"],
            coordinates: LatLng(double.parse((e["latitude"] as String)), double.parse((e["longitude"] as String))),
            folderId: folderId))
        .toList();
    return _GetRes(error: null, locations: locations, categories: categories);
  }
}

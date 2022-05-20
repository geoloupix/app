import 'package:geoloupix/app/controllers/api.dart';
import 'package:geoloupix/app/controllers/auth.dart';
import 'package:geoloupix/app/models/category.dart';
import 'package:geoloupix/app/models/location.dart';
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

  final List<Location> locations = [];

  Future<_GetRes> getAll({String? folderId}) async {
    final response = await api.getFoldersAndLocations(folderId == null ? {} : {"folder_id": folderId});
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

  Future<String?> getLocations({String? id}) async {
    final response = await api.getLocations(id == null ? {} : {"id": id});
    if (response["error"] != null) return response["error"];
    final locations = (response["locations"] as List<dynamic>)
        .map((e) => Location(
            id: e["id"],
            name: e["name"],
            coordinates: LatLng(double.parse((e["latitude"] as String)), double.parse((e["longitude"] as String))),
            folderId: e["parent_id"]))
        .toList();
    this.locations.clear();
    this.locations.addAll(locations);
    return null;
  }
}

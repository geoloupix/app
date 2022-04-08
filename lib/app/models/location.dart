import 'package:latlong2/latlong.dart';

class Location {
  final String id;
  final String name;
  final LatLng coordinates;
  final String? folderId;

  const Location({required this.id, required this.name, required this.coordinates, required this.folderId});
}

import 'package:app/app/core/constants.dart';
import 'package:app/widgets/add_location_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final MapController mapController = MapController();
  static const double defaultZoomValue = 6.5;

  void _animatedMapMove(LatLng destLocation, [double destZoom = defaultZoomValue]) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final _latTween = Tween<double>(begin: mapController.center.latitude, end: destLocation.latitude);
    final _lngTween = Tween<double>(begin: mapController.center.longitude, end: destLocation.longitude);
    final _zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final animationController = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);

    Animation<double> animation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);

    animationController.addListener(() {
      mapController.move(
          LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)), _zoomTween.evaluate(animation));
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.dispose();
      } else if (status == AnimationStatus.dismissed) {
        animationController.dispose();
      }
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.colors.white,
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: LatLng(46.71109, 1.7191036),
              zoom: defaultZoomValue,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                attributionBuilder: (_) {
                  return Text("© OpenStreetMap contributors", style: AppConstants.texts.paragraph);
                },
              ),
              MarkerLayerOptions(
                  markers: [LatLng(51.5, -0.09), LatLng(30.5, 5)]
                      .map(
                        (e) => Marker(
                          width: 40,
                          height: 40,
                          point: e,
                          builder: (context) => GestureDetector(
                              onTap: () {
                                print(e);
                                late final double zoom;
                                if (mapController.zoom == defaultZoomValue) {
                                  zoom = 10;
                                } else if (mapController.zoom == 10) {
                                  zoom = 15;
                                } else {
                                  zoom = defaultZoomValue;
                                }
                                _animatedMapMove(e, zoom);
                              },
                              child: Icon(Icons.location_on_rounded, size: 40, color: AppConstants.colors.red)),
                        ),
                      )
                      .toList()),
            ],
          ),
          Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                  onTap: () {
                    print("tapped");
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration:
                          BoxDecoration(color: AppConstants.colors.white, borderRadius: BorderRadius.circular(12)),
                      child: Stack(
                        children: [
                          Icon(Icons.notifications_rounded, color: AppConstants.colors.grey),
                          Positioned(
                              top: 1,
                              right: 1,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: AppConstants.colors.red, borderRadius: BorderRadius.circular(9999)),
                              ))
                        ],
                      ))))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppConstants.colors.primary,
          foregroundColor: AppConstants.colors.white,
          elevation: 1,
          child: const Icon(Icons.add_rounded),
          onPressed: () async {
            await showModalBottomSheet<void>(context: context, builder: (context) => const AddLocationSheet());
          }),
      bottomNavigationBar: BottomAppBar(
          elevation: 1,
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/storage"),
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Icon(Icons.menu_rounded, color: AppConstants.colors.grey))),
                GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/profile"),
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Icon(Icons.person_rounded, color: AppConstants.colors.grey))),
              ],
            ),
          )),
    );
  }
}

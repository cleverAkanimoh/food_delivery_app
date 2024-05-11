import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final bool? isTrackOrder;
  const MapPage({
    super.key,
    this.isTrackOrder = false,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng _pGoogleplex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplepark = LatLng(37.3346, -122.0090);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation() {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints(
      getRoutesBetweenCoordinates.google_api_key,
      PointLatLang(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLang(destination.latitude, destination.longitude),
    );
    if (results.points.isNotEmpty) {
      results.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          "Your location",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: currentLocation == null
          ? const Center(
              child: Text("Loading"),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
                zoom: 13,
              ),
              polylines: {
                Polyline(
                  polylineId: PolylineId("route"),
                  points: polylineCoordinates,
                  color: Theme.of(context).colorScheme.secondary,
                  width: 5,
                ),
              },
              markers: {
                Marker(
                  markerId: const MarkerId("currentLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(
                    currentLocation!.latitude!,
                    currentLocation!.longitude!,
                  ),
                ),
                const Marker(
                  markerId: MarkerId("source"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGoogleplex,
                ),
                const Marker(
                  markerId: MarkerId("destination"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pApplepark,
                ),
              },
            ),
    );
  }
}

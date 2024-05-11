import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng _pGoogleplex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplepark = LatLng(37.3346, -122.0090);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Your location"),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: _pGoogleplex,
          zoom: 13,
        ),
        markers: {
          const Marker(
            markerId: MarkerId("_currentLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pGoogleplex,
          ),
          const Marker(
            markerId: MarkerId("_otherLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pApplepark,
          ),
        },
      ),
    );
  }
}

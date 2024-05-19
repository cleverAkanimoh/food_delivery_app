import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '/constants.dart';
import '/widgets/back_button.dart';

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
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);

  Location location = Location();
  LatLng? _userLocation;
  LocationData? _locationData;

  // void _liveLocation() {}

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          "Your location",
          style: TextStyle(
            fontSize: headingSize,
          ),
        ),
      ),
      body: Center(
        child: _userLocation == null
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(),
                  SizedBox(width: extraSmallWhiteSpace),
                  Text("Loading..."),
                ],
              )
            : GoogleMap(
                onMapCreated: (GoogleMapController controller) =>
                    _mapController.complete(controller),
                initialCameraPosition: CameraPosition(
                  target: _userLocation!,
                  zoom: 13,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId("currentLocation"),
                    position: _userLocation!,
                  ),
                  // const Marker(
                  //   markerId: MarkerId("sourceLocation"),
                  //   position: _pGooglePlex,
                  // ),
                  // const Marker(
                  //   markerId: MarkerId("destinationLocation"),
                  //   position: _pApplePark,
                  // ),
                },
              ),
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );

    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getCurrentLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      _userLocation = LatLng(
        _locationData!.latitude!,
        _locationData!.longitude!,
      );
      _cameraToPosition(_userLocation!);
    });
    // location.onLocationChanged.listen(
    //   (LocationData locationData) {
    //     if (locationData.latitude != null && locationData.longitude != null) {
    //       setState(
    //         () {
    //           _userLocation = LatLng(
    //             locationData.latitude!,
    //             locationData.longitude!,
    //           );

    //           _cameraToPosition(_userLocation!);
    //         },
    //       );
    //     }
    //   },
    // );
  }
}

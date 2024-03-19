import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late GoogleMapController mapController;
  Location _locationController = Location();
  static const LatLng initialCameraPosition = LatLng(28.7041, 77.1025);
  static const LatLng destinationCameraPosition = LatLng(28.4595, 77.0266);
  Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: initialCameraPosition, zoom: 14),
        // markers: ,
        onMapCreated: (controller) {
          mapController = controller;
          addMarker('initialMarker', initialCameraPosition);
        },
        markers: Set<Marker>.from(_markers.values),
      ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }
    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
    }
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  Future<void> addMarker(String id, LatLng location) async {
    var marker = Marker(
      position: location,
      markerId: MarkerId(id),
      infoWindow: const InfoWindow(
        title: 'Title of place',
        snippet: 'Some description of the place',
      ),
    );
    _markers[id] = marker;
    setState(() {});
  }
}

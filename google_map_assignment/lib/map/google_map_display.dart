import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapDisplay extends StatefulWidget {
  GoogleMapDisplay({Key? key}) : super(key: key);

  @override
  State<GoogleMapDisplay> createState() => _GoogleMapDisplayState();
}

class _GoogleMapDisplayState extends State<GoogleMapDisplay> {
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  static const LatLng center = LatLng(26.89635746643776, 75.75761796091304);

  final Set<Marker> markers = {};
  LatLng lastMapPosition = center;

  MapType currentMapType = MapType.normal;

  void onMapTypeButtonPressed() {
    setState(() {
      currentMapType =
          currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  void onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  void onMapCreated(GoogleMapController c) async {
    controller.complete(c);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google map'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: center,
              zoom: 15.0,
            ),
            mapType: currentMapType,
            markers: {
              const Marker(markerId: MarkerId('Home'), position: center)
            },
            onCameraMove: onCameraMove,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: onMapTypeButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.map, size: 36.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

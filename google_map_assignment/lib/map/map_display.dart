import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDisplay extends StatefulWidget {
  const MapDisplay({Key? key}) : super(key: key);

  @override
  State<MapDisplay> createState() => _MapDisplayState();
}

class _MapDisplayState extends State<MapDisplay> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(26.89635746643776, 75.75761796091304),
        initialZoom: 9.0,
      ),
      children: [
        TileLayer(
          minZoom: 1,
          maxZoom: 18,
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
          subdomains: const ['a', 'b', 'c'],
        ),
        const MarkerLayer(markers: [
          Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(26.89635746643776, 75.75761796091304),
              child: Icon(
                Icons.pin_drop,
                color: Colors.blue,
              ))
        ]),
      ],
    );
  }
}

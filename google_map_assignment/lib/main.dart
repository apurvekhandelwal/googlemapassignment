import 'package:flutter/material.dart';
import 'package:google_map_assignment/map/google_map_display.dart';
// import 'package:google_map_assignment/map/map_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GoogleMapDisplay(),
    );
  }
}

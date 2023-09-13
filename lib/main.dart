import 'package:favorite_places/screens/places_screen.dart';
import 'package:flutter/material.dart';

import 'package:favorite_places/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Great Places",
      theme: theme,
      home: const PlacesScreen(),
    );
  }
}
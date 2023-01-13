import 'package:flutter/material.dart';
import 'package:platform_c/views/screens/HomePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
      },
    ),
  );
}

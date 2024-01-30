import 'package:flutter/material.dart';
import 'package:calculator/home.dart';
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Home(),
      ),
    ),
  );
}

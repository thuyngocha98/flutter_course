import 'package:flutter/material.dart';
import 'package:flutter_course/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          startAlignment: Alignment.topLeft,
          endAlignment: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 96, 9, 177),
            Color.fromARGB(255, 46, 4, 85),
          ],
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

BoxDecoration boxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.black,
        Colors.white10,
      ],
    ),
  );
}

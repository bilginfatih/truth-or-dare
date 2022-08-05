import 'package:flutter/material.dart';

Widget defaultButton({
  required String text,
  required Color color,
  Function? function,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: color,
    ),
    child: MaterialButton(
      minWidth: double.infinity,
      padding: const EdgeInsets.all(18.0),
      //elevation: 26.0,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        function!();
      },
    ),
  );
}



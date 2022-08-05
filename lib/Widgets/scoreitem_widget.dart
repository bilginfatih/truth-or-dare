import 'package:flutter/material.dart';


  
  Widget scoreItem({required String name, required int score}) {
  return Container(
    height: 50.0,
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    color: Colors.black12,
    width: double.infinity,
    child: Row(
      children: [
        Expanded(
          child: Text(
            name,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[300],
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Text(
          score.toString(),
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[300],
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );
}
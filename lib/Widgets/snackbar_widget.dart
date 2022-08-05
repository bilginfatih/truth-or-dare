import 'package:flutter/material.dart';

SnackBar snackBar({
  required Text content,
}) {
  return SnackBar(
    content: content,
    backgroundColor: Colors.red,
    shape: const StadiumBorder(),
  );
}

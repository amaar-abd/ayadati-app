import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.fixed,
      duration: Duration(seconds: 2),
      backgroundColor: color,
      content: Text(message, textAlign: TextAlign.center),
    ),
  );
}

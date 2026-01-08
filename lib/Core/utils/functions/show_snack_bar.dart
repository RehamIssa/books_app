import 'package:flutter/material.dart';

void showSnackbar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

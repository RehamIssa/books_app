import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: buildOutlinedInputBorder(),
        enabledBorder: buildOutlinedInputBorder(),
        hint: const Text('search'),
        suffixIcon: const Opacity(
          opacity: 0.8,
          child: Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.white),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlinedInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}

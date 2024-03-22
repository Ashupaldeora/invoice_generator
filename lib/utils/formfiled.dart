import 'package:flutter/material.dart';

TextFormField input(TextEditingController controller, TextInputType keyboard) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return "";
      } else {
        return null;
      }
    },
    keyboardType: keyboard,
    controller: controller,
    decoration: InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orangeAccent)),
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red))),
  );
}

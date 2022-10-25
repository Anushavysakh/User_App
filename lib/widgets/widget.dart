import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hintText) {
  return InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ));

}

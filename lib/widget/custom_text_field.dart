import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController nameController,
    required this.labelText,
    required this.hintText,
    required this.validation,
  }) : _nameController = nameController;

  final TextEditingController _nameController;
  final String labelText;
  final String hintText;
  final Function validation;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            focusColor: Colors.black,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            labelStyle: const TextStyle(color: Colors.black),
            labelText: labelText,
            hintText: hintText),
        validator: (text) => validation(text));
  }
}

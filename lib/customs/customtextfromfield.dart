import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool obscure;
  IconData icon;
  CustomField({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(40)),
          prefixIcon: Icon(icon),
          fillColor: Colors.grey,
          filled: true,
          hintText: label,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please fill data";
          } else if (label == "Name" && value.length < 3) {
            return "Name must be at least 3 characters";
          } else if (label == "Email" && !value.contains("@gmail.com")) {
            return "Enter a valid Email";
          } else if (label.toLowerCase() == "password" && value.length < 8) {
            return "Password must be more than 8 characters";
          }
          return null;
        },
      ),
    );
  }
}

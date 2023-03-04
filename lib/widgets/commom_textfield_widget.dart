import 'package:flutter/material.dart';

class CommonTextFielWidget extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  bool? isRequired;
  CommonTextFielWidget({
    super.key, 
    required this.hintText ,   
    required this.controller,
    this.isRequired,
  });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.12),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white54,
          fontSize: 14.0
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 14.0
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide.none
        ),
        enabledBorder: OutlineInputBorder(           
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide.none
        ),
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty && isRequired == true) {
          return "Obligatory field";
        }
        return null;
      },
    );
  }
}
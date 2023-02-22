import 'package:flutter/material.dart';

class CommonTextFielWidget extends StatelessWidget {
  String hintText;
  CommonTextFielWidget({super.key, required this.hintText});
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.12),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white54,
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
        )
      ),
    );
  }
}
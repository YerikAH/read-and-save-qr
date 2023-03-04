import 'package:flutter/material.dart';
import 'package:read_qr/screens/screens.dart';
import 'package:read_qr/theme/theme_app.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Read and Save QR",
      theme: ThemeApp.configTheme,
      home: const HomeScreen()
    );
  }
}
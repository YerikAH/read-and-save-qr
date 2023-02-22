import 'package:flutter/material.dart';
import 'package:read_qr/widgets/commom_textfield_widget.dart';
import 'package:read_qr/widgets/common_button_widget.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
        children: [
        const Text(
            "Registrar contenido",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700
            ),
          ),
          const Text(
            "Por favor ingresa los campos requeridos",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14.0,
              fontWeight: FontWeight.w400
            ),
          ),
          CommonTextFielWidget(hintText: "Ingresa un titúlo...",),
          const SizedBox(height: 15.0,),
          CommonTextFielWidget(hintText: "Ingresa una observación...",),
          const SizedBox(height: 20.0,),
          CommonButtonWidget(onPressed: (){}, text: "Guardar",)
        ],
        )
      )
    );
  }
}
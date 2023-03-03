import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:read_qr/db/db_admin.dart';
import 'package:read_qr/models/models.dart';
import 'package:intl/intl.dart';
import 'package:read_qr/widgets/commom_textfield_widget.dart';
import 'package:read_qr/widgets/common_button_widget.dart';

class RegisterScreen extends StatelessWidget {
   
  RegisterScreen({Key? key}) : super(key: key);
  
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _observationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
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
                    const SizedBox(height: 30.0,),
                    CommonTextFielWidget(hintText: "Ingresa un titúlo...",controller: _titleController, isRequired: true),
                    const SizedBox(height: 15.0,),
                    CommonTextFielWidget(hintText: "Ingresa una observación...",controller: _observationController, isRequired: false),
                    const SizedBox(height: 20.0,),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      child: QrImage(
                        data: '12455', 
                        version: QrVersions.auto,
                        size:200.0
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                  ],
                  ),
                ),
              ),
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CommonButtonWidget(
                onPressed: (){
                if (_formKey.currentState!.validate()) {
                  print("Hola mundo");
                  FocusScopeNode myFocusScope = FocusScope.of(context);
                  myFocusScope.unfocus();
                  DateFormat myFormat = DateFormat("dd/MM/yyyy hh:mm");
                  String myDate = myFormat.format(DateTime.now());
                  QRModel mantequilla = QRModel(
                      title: _titleController.text,
                      observation:_observationController.text,
                      url: "",
                      datetime: myDate,
                  );
                  print(mantequilla.toJson());

                  DBAdmin admin = DBAdmin();
                  admin.getQRList();
                }
                }, text: "Guardar",
                ),
            )
            )
        ],
      )
    );
  }
}
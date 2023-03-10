import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:read_qr/db/db_admin.dart';
import 'package:read_qr/models/models.dart';
import 'package:intl/intl.dart';
import 'package:read_qr/screens/screens.dart';
import 'package:read_qr/widgets/commom_textfield_widget.dart';
import 'package:read_qr/widgets/common_button_widget.dart';

class RegisterScreen extends StatelessWidget {
  String url;
  RegisterScreen({super.key, required this.url});
  
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
                      "Register content",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    const Text(
                      "Please enter the required fields",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(height: 30.0,),
                    CommonTextFielWidget(hintText: "Enter a title...",controller: _titleController, isRequired: true),
                    const SizedBox(height: 15.0,),
                    CommonTextFielWidget(hintText: "Enter a description...",controller: _observationController, isRequired: false),
                    const SizedBox(height: 20.0,),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      child: QrImage(
                        data: url, 
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
                  FocusScopeNode myFocusScope = FocusScope.of(context);
                  myFocusScope.unfocus();
                  DateFormat myFormat = DateFormat("dd/MM/yyyy hh:mm");
                  String myDate = myFormat.format(DateTime.now());
                  QRModel mantequilla = QRModel(
                      title: _titleController.text,
                      observation:_observationController.text,
                      url: url,
                      datetime: myDate,
                  );
                  Future.delayed(const Duration(milliseconds: 400), () {
                    DBAdmin().insertQR(mantequilla).then((value) {
                      if (value >= 0) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false
                        );
                        //Snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: const Color(0xffbc00dd),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            behavior: SnackBarBehavior.floating,
                            content: const Text(
                                "Your QR was registered correctly."),
                          ),
                        );
                      }
                    });
                  });
                  DBAdmin admin = DBAdmin();
                  admin.getQRList();
                }
                }, text: "Save",
                ),
            )
            )
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:read_qr/screens/screens.dart';
import 'package:read_qr/theme/colors.dart';
import 'package:read_qr/widgets/common_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: kBrandBlack,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Read and Save QR", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800
                ),),
                const SizedBox(height: 12.0,),
                const Text(
                    "Manage the qr codes of your preference and access whenever you want", 
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400
                  ),
                ),
                Image.asset("assets/images/qr.png", width: width * 0.80,),
                CommonButtonWidget(
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=>ScannerScreen())
                    );
                  }, 
                  text: "Scan QR",
                ),
                const SizedBox(height: 20.0,),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> const HistoryScreen())
                      );
                    },
                    child: const Text(
                      "View history",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kBrandGreen,
                        fontSize: 14.0,
                      )
                    )
                    ),
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:read_qr/theme/colors.dart';

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
              children: [
                const Text("Read and Save QR", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700
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
                SizedBox(
                  width: double.infinity,
                  height: 48.0,
                  child: ElevatedButton(
                      onPressed: () {}, 
                      child: Text("Escanear codigó QR",                   
                      style: TextStyle(
                        color: kBrandBlack,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500
                      ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kBrandGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0)
                        )
                      ),),
                ),
                TextButton(
                  
                  onPressed: () {},
                  child: Text("Ver el historial",
                  style: TextStyle(
                    color: kBrandGreen,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500
                  ))
                  ),
              ],
            ),
          ),
        ));
  }
}

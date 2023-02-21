import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xFF12151A),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Read and Save QR", style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700
                ),),
                const SizedBox(height: 12.0,),
                Text(
                    "Manage the qr codes of your preference and access whenever you want", 
                  textAlign: TextAlign.center, 
                  style: GoogleFonts.montserrat(
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
                      onPressed: () {}, child: Text("Escanear codigó QR"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff29F5BE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0)
                        )
                      ),),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Ver el historial")),
              ],
            ),
          ),
        ));
  }
}

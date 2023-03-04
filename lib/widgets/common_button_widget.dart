import "package:flutter/material.dart";
import 'package:read_qr/theme/colors.dart';

class CommonButtonWidget extends StatelessWidget {
  Function? onPressed;
  String text;
  CommonButtonWidget({
    super.key, 
    required this.onPressed,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
          onPressed: () {
            onPressed != null ? onPressed!(): null
            ;
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: kBrandGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0)
            )
          ),
          child: Text(
            text,                   
            style: const TextStyle(
              color: kBrandBlack,
              fontSize: 14.0,
              fontWeight: FontWeight.w700
            ),
          ),
      ),
    );
  }
}
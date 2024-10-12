import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField1 extends StatelessWidget {
  const CustomField1(this.text, this.color1, {super.key,required this.text1,});
  final String text;
  final Color color1;
  final TextEditingController? text1;
  @override
  Widget build(context) {
    return TextField(
      controller: text1,
      decoration: InputDecoration(
        label: Text(
          text,
          style: GoogleFonts.pacifico(color: color1),
        ),


      ),
    );
  }
}

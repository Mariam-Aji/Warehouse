
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_basics/models/detailes_order.dart';
import 'package:project_basics/models/model_order.dart';

class Details extends StatelessWidget{
  Details({super.key,required this.info});
  final ModelOrder info;
  @override
  Widget build(context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 249, 249),
        appBar: AppBar(
        title: const Text('Details'),
    backgroundColor: const Color.fromARGB(255, 15, 137, 202),),
      body: Center(
        child: Column(


            children: [
              SizedBox(
                height: 70,
              ),
              Image.asset('images/info.png'),
              SizedBox(
                height: 30,
              ),
              Text('Total Price:  ${info.totalPrice}',style:  GoogleFonts.acme(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 15, 137, 202),),),
              SizedBox(height:20),
            ],


          ),
      ),
    );

  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:project_basics/models/model_order.dart';
import 'package:project_basics/widgets/detailes.dart';
import 'package:http/http.dart'as http;
class MyOrderScreen extends StatefulWidget{
  MyOrderScreen({super.key,required this.m});
  final ModelOrder m;

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState(m);
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  _MyOrderScreenState(this.m);
  final ModelOrder m;
  String stateOrder='In preparation';
  Future getState(var iduser,var id )async{
    final response =
    await http.get(Uri.parse('http://192.168.1.105:8000/api/getOrderStatusForPharmacist/${iduser}/${id}'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      setState(() {
        stateOrder=data['order_status'];
        print('m');
      });


  }}
  @override
  void initState() {
    getState(m.userId, m.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('My Order' + m.id.toString()),
         backgroundColor: const Color.fromARGB(255, 15, 137, 202),
        actions: [
        IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Details(info:m),
            ),
          );

        }, icon: Icon(Icons.info_outline,
       color: Color.fromARGB(255, 250, 226, 92),),)]),
      body:
         Center(
           child: Column(
             mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.center,
               children:[
                 Text('First Medicine:'+m.firstMed.toString()
                   ,style:  GoogleFonts.acme(
                   fontSize: 23,
                   fontWeight: FontWeight.bold,
                   color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:5),
                 Text('Quantity: '+m.quantity1.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:5),
                 Text('Price :'+m.price1.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:15),
                 Text('Second Medicine:'+m.secondMed.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:5),
                 Text('Quantity: '+m.quantity2.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:5),
                 Text('Price :' +m.price2.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:15),
                 Text('Third Medicine:' +m.thirdMed.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:5),
                 Text('Quantity: '+m.quantity3.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:5),
                 Text('Price :'+m.price3.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:15),
                 Text('Fourth Medicine:'+m.fourthMed.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:5),
                 Text('Quantity: '+m.quantity4.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:5),
                 Text('Price :'+m.price4.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:15),
                 Text('Fifth Medicine: '+m.fifthMed.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:5),
                 Text('Quantity: '+m.quantity5.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:5),
                 Text('Price : '+m.price5.toString()
                   ,style:  GoogleFonts.acme(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 15, 137, 202),),),
                 SizedBox(height:20),

                 ElevatedButton(onPressed: (){}, style:  ElevatedButton.styleFrom(
                 padding: const EdgeInsets.symmetric(
                   vertical: 15,
                   horizontal: 40,
                 ),
                 backgroundColor: Color.fromARGB(255, 250, 226, 92),
                 foregroundColor:  Color.fromARGB(255, 15, 137, 202),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(50),
                 )),
               child: Text(
                 stateOrder,
                 style: GoogleFonts.acme(fontSize: 23,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
       ] ),
         ),




    );
  }
}
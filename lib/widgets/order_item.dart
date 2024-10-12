 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_basics/widgets/custom_firld1.dart';
import 'package:http/http.dart' as http;
class OrderItem extends StatefulWidget{

  OrderItem({super.key,required this.id});
  final int id;

  @override
  State<OrderItem> createState() => _OrderItemState(id);
}

class _OrderItemState extends State<OrderItem> {
  _OrderItemState( this.id);
  int id;
  String m='Send';
  Color color =Color.fromARGB(255, 15, 137, 202);
  final nameController1=TextEditingController();
  final amountCountroller1=TextEditingController();
  final nameController2=TextEditingController();
  final amountCountroller2=TextEditingController();
  final nameController3=TextEditingController();
  final amountCountroller3=TextEditingController();
  final nameController4=TextEditingController();
  final amountCountroller4=TextEditingController();
  final nameController5=TextEditingController();
  final amountCountroller5=TextEditingController();
  Future order( String name1,String amount1,String name2,String amount2,String name3,String amount3,String name4,String amount4,String name5,String amount5) async {
    var response = await http.post(
        Uri.parse('http://192.168.1.105:8000/api/addtalabia'),
        body: <String, String>{
        'first_med':name1,
          'quantity1':amount1,
          'second_med':name2,
          'quantity2':amount2,
          'third_med':name3,
          'quantity3':amount3,
          'fourth_med':name4,
          'quantity4':amount4,
          'fifth_med':name5,
          'quantity5':amount5,
          'user_id':id.toString()
        });
    if (response.statusCode == 200) {
      setState(() {
        m='Success';
      });
    } else {
      setState(() {
        color = Colors.red;
      });

    }
  }
  @override
  Widget build(contex){
    return Padding(padding: EdgeInsets.all(16),
     child:SingleChildScrollView(
       child: Column(
          children: [
            CustomField1('Name1',color, text1:nameController1),
            SizedBox(height: 10,),
            CustomField1('Amount1',color, text1:amountCountroller1),
            SizedBox(height: 10,),
            CustomField1('Name2',color, text1:nameController2),
            SizedBox(height: 10,),
            CustomField1('Amount2',color, text1:amountCountroller2),
            SizedBox(height: 10,),
            CustomField1('Name3',color, text1:nameController3),
            SizedBox(height: 10,),
            CustomField1('Amount3',color, text1:amountCountroller3),
            SizedBox(height: 10,),
            CustomField1('Name4',color, text1:nameController4),
            SizedBox(height: 10,),
            CustomField1('Amount4',color, text1:amountCountroller4),
            SizedBox(height: 10,),
            CustomField1('Name5',color, text1:nameController5),
            SizedBox(height: 10,),
            CustomField1('Amount5',color, text1:amountCountroller5),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                order(nameController1.text, amountCountroller1.text, nameController2.text, amountCountroller2.text,
                    nameController3.text, amountCountroller3.text, nameController4.text, amountCountroller4.text,
                  nameController5.text,amountCountroller5.text );
              },
              style: ElevatedButton.styleFrom(
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
                m,
                style: GoogleFonts.acme(fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
       ),
     )




    );

  }
}
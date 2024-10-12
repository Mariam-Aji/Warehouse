import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_basics/models/model_order.dart';
import 'package:project_basics/widgets/my_order_screen.dart';
import 'package:http/http.dart'as http;
class OrderPharmacy extends StatefulWidget{
  OrderPharmacy({super.key,required this.id});
  final int id;
  @override
  State<OrderPharmacy> createState() => _OrderPharmacyState(id);
}

class _OrderPharmacyState extends State<OrderPharmacy> {
  _OrderPharmacyState(this.id);
  final int id;
  List<ModelOrder> order=[];
  Future<List<ModelOrder>> fetchOrders()  async {
  final response =
      await http.get(Uri.parse('http://192.168.1.105:8000/api/getorderpharmacist/${id}'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    print('nn');
  order.clear();
  for (Map<String, dynamic> i in data) {
  order.add(ModelOrder.fromJson(i));
  }
  return order;
  } else {
  return order;
  }
}



  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Your Orders'),
        backgroundColor: const Color.fromARGB(255, 15, 137, 202),
      ),
      body: Center(
        child: Column(
          children:[
            Image.asset('images/order1.png'),
        SizedBox(
          height: 10,
        ),
        Expanded(
               child: FutureBuilder(
                future: fetchOrders(),
                 builder: (context, snapshot) {
                   if (!snapshot.hasData) {
                     return Center(
                       child: Text(
                         'loading',
                         style: GoogleFonts.acme(
                           fontSize: 30,
                           color: const Color.fromARGB(255, 72, 146, 185),
                         ),
                       ),
                     );
                   }
                   else {
                     return ListView.builder(
                         itemCount: order.length, itemBuilder:
                         (ctx, index) =>
                         InkWell(
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) =>
                                     MyOrderScreen(m: order[index]),
                               ),
                             );
                           },
                           child: ListTile(
                               leading: Image.asset('images/order.png'),
                               title: Center(child: Text(
                                 'Order${order[index].id.toString()}',
                                 style: GoogleFonts.acme(
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold,
                                   color: Color.fromARGB(255, 15, 137, 202),
                                 ),),
                               )

                           ),

                         )
                     );
                   }
                 } )
        )
          ]
        ),
      )
    );
  }
}
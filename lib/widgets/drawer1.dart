import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_basics/pharmacy.dart';
import 'package:http/http.dart' as http;
import 'package:project_basics/widgets/order_pharmacy.dart';
class Drawer1 extends StatefulWidget{
  const Drawer1(this.token,this.id,{super.key});
  final String token;
  final int id;
  @override
  State<Drawer1> createState() => _Drawer1State(token,id);
}

class _Drawer1State extends State<Drawer1> {

  _Drawer1State(this.token,this.id);
   final String token;
   final int id;
  Future logout( String token) async {
    var response = await http.post(
        Uri.parse('http://192.168.1.105:8000/api/auth/logout'),
        body: <String, String>{
        'token':token
        });
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pharmacy(),
        ),
      );
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext contex){
    return  Drawer(
      child: Column(
        children: [
          DrawerHeader(padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[
                     Color.fromARGB(255, 15, 137, 202),
                    Color.fromARGB(255, 15, 137, 202).withOpacity(0.8),
                  ],
                  begin:Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              ),
              child:Row(
                children: [
                  Icon(Icons.local_pharmacy_rounded,size: 60,color:  Colors.white,),
                  SizedBox(width:15,),
                  Text('Pharmacy',style:GoogleFonts.acme(
                      fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )),
                ],
              ),),
               ListTile(leading: Icon(Icons.shop_rounded,size: 35,color:Color.fromARGB(255, 15, 137, 202),)
                 ,title: Text('MyOrder',style:GoogleFonts.acme(
                 fontSize: 25,
                 fontWeight: FontWeight.bold,
                  color:Color.fromARGB(255, 15, 137, 202)
                ) ,),onTap: (){
                  Navigator.push(
                 contex,
                MaterialPageRoute(
                builder: (context) =>OrderPharmacy(id:id),
        ),
      );
                 },),
               ListTile(leading: Icon(Icons.logout,size: 35,color:Color.fromARGB(255, 15, 137, 202),),
                 title: Text('Logout',style:GoogleFonts.acme(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color:Color.fromARGB(255, 15, 137, 202)
            ) ,),onTap: (){
                 logout(token);
                 },),
        ],

      ),
    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_basics/categories_screen.dart';
import 'package:project_basics/register_screen.dart';
import 'package:project_basics/widgets/custom_field.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  Color textColor = Color.fromARGB(255, 15, 137, 202);
  var id;
  final usernumberphoneController = TextEditingController();
  final userpasswordController=TextEditingController();
  Future SignIn( String numberphone,String Password,String type) async {
    var response = await http.post(
        Uri.parse('http://192.168.1.105:8000/api/auth/login1'),
        body: <String, String>{
          'phone': numberphone,
          'password':Password,
          'type':type
        });
    if (response.statusCode == 200) {
      var js =jsonDecode(response.body);
      print('k');
      String token =js['token'];
       id=js['user']['id'];
      print(token);
      print('success');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoriesScreen(token,id),
        ),
      );
    } else {

      setState(() {
        textColor = Colors.red;
        usernumberphoneController.text = 'please enter the correct number';
      });

    }
    }



  @override
  Widget build(context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/p.png',
                  width: 400,
                ),
                const SizedBox(
                  height: 40,
                ),
                 CustomField('NumberPhone',textColor,text1: usernumberphoneController),
                 SizedBox(
                   height: 10,
                 ),
                CustomField('Password',textColor,text1: userpasswordController),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {

                    SignIn(usernumberphoneController.text,userpasswordController.text,'pharmacist');

                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 40,
                      ),
                      backgroundColor: const Color.fromARGB(255, 15, 137, 202),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  child: Text(
                    'Login',
                    style: GoogleFonts.josefinSans(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an account?  ",
                      style: GoogleFonts.acme(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 67, 112, 161),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: GoogleFonts.acme(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 67, 112, 161),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

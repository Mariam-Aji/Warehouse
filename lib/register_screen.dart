import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_basics/categories_screen.dart';
import 'package:project_basics/login_screen.dart';
import 'package:project_basics/widgets/custom_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   String token="" ;
   var id;
  Color textColor = Color.fromARGB(255, 15, 137, 202);
  String dropdownvalue = 'pharmacist';
  final userusernameController = TextEditingController();
  final useremailController = TextEditingController();
  final userpasswordController = TextEditingController();
  final usernumberphoneController = TextEditingController();
  Future signUP(String username, String email, String password,
      String numberphone, String type) async {
    var response = await http.post(
        Uri.parse('http://192.168.1.105:8000/api/auth/register'),
        body: <String, String>{
          'name': username,
          'email': email,
          'password': password,
          'type': type,
          'phone': numberphone,
        });
    if (response.statusCode == 201) {
      var js = jsonDecode(response.body);
      token = js['data']['original']['access_token'];
      id= js['data']['original']['user']['id'];
      print('token:$token');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoriesScreen(token,id),
        ),
      );
    } else {
      setState(() {
        textColor = Colors.red;
        userusernameController.text = 'check your informations';
      });
    }
  }

  @override
  Widget build(context) {
    return Material(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('images/pp.png'),
                radius: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomField(
                'Username',
                textColor,
                text1: userusernameController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomField(
                'Email',
                textColor,
                text1: useremailController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomField(
                'Password',
                textColor,
                text1: userpasswordController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomField(
                'NumberPhone',
                textColor,
                text1: usernumberphoneController,
              ),
              const SizedBox(
                height: 5,
              ),
              DropdownButton<String>(
                value: dropdownvalue,
                icon: const Icon(Icons.menu),
                style: const TextStyle(
                  color: Color.fromARGB(255, 15, 137, 202),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'pharmacist',
                    child: Text('pharmacist'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  signUP(
                      userusernameController.text,
                      useremailController.text,
                      userpasswordController.text,
                      usernumberphoneController.text,
                      dropdownvalue);
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
                  'Register',
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
                    "Already have an account?  ",
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
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
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
    );
  }
}

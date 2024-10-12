import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_basics/data/mediciene_details_screen.dart';
import 'package:project_basics/models/model_medicine.dart';
import 'package:project_basics/widgets/custom_field.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  Color color = Color.fromARGB(255, 15, 137, 202);
  ModelMedicine? m;

  Future<ModelMedicine?> search(String text) async {
    var response = await http.post(
        Uri.parse('http://192.168.1.105:8000/api/searchmed'),
        body: <String, String>{
          'commercial_name': text,
        });
    if (response.statusCode == 200) {
      var js = jsonDecode(response.body);
      m = ModelMedicine.fromJson(js);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MedicieneDetailsScerrn(med: m!),
          ));
      return m;
    } else {
      setState(() {
        searchController.text = 'please enter the correct name ';
        color = Colors.red;
      });
      return m;
    }
  }

  @override
  Widget build(contex) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: const Color.fromARGB(255, 15, 137, 202),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/R.png'),
            Text(
              'Please enter the name of mediciene.....',
              style: GoogleFonts.kanit(
                fontSize: 20,
                color: Color.fromARGB(255, 250, 226, 92),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomField('search', color, text1: searchController),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                search(searchController.text);
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 40,
                  ),
                  backgroundColor: Color.fromARGB(255, 250, 226, 92),
                  foregroundColor: Color.fromARGB(255, 15, 137, 202),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
              child: Text(
                'Search',
                style: GoogleFonts.acme(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

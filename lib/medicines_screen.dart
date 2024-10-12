import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_basics/data/mediciene_details_screen.dart';
import 'package:project_basics/widgets/mediciene_item.dart';
import 'package:project_basics/models/model_medicine.dart';

class MedicinesScreen extends StatefulWidget {
  MedicinesScreen({super.key, required this.title, required this.id});
  final String title;
  final String id;
  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState(title, id);
}

class _MedicinesScreenState extends State<MedicinesScreen> {
  _MedicinesScreenState(this.title, this.id);

  final String title;

  final String id;

  void selectMedeciene(BuildContext context, ModelMedicine med) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MedicieneDetailsScerrn(med: med),
        ));
  }

  List<ModelMedicine> medicine = [];

  Future<List<ModelMedicine>> fetchMedicines(String id) async {
    final response = await http.get(
        Uri.parse('http://192.168.1.105:8000/api/getmedicineFromOneCategory/$id'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      medicine.clear();
      for (Map<String, dynamic> i in data) {
        medicine.add(ModelMedicine.fromJson(i));
      }
      return medicine;
    } else {
      return medicine;
    }
  }

  @override
  Widget build(context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: const Color.fromARGB(255, 15, 137, 202),
        ),
        body: FutureBuilder(
            future: fetchMedicines(id),
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
              } else {
                return ListView.builder(
                  itemCount: medicine.length,
                  itemBuilder: (ctx, index) => MedicieneItem(
                      medicine: medicine[index],
                      OnSelectedMediciene: (medicine) {
                        selectMedeciene(ctx, medicine);
                      }),
                );
              }
            }));
  }
}

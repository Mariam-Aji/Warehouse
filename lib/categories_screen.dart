import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_basics/data/search_screen.dart';
import 'package:project_basics/medicines_screen.dart';
//import 'package:project_basics/medicines_screen.dart';

import 'package:project_basics/widgets/custom_gridofsquares.dart';
import 'package:project_basics/widgets/drawer1.dart';
import 'package:project_basics/widgets/order_item.dart';
import 'package:project_basics/models/model_categiory.dart';
import 'package:http/http.dart' as http;

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen(
    this.token,
      this.id,{
    super.key,
  });
  final String token;
  final int id;
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState(token,id);
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  _CategoriesScreenState(this.token,this.id);
  final String token;
  final int id;
  List<ModelCategiory> model = [];
  Future<List<ModelCategiory>> fetchCategories() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.105:8000/api/getcatogery'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      model.clear();
      for (Map<String, dynamic> i in data) {
        model.add(ModelCategiory.fromJson(i));
      }
      return model;
    } else {
      return model;
    }
  }

  void onOrder(int id) {
    showModalBottomSheet(context: context, builder: (ctx) => OrderItem(id: id));
  }

  void _selectCategory(BuildContext context, ModelCategiory category) {
    var id = category.id.toString();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedicinesScreen(
          title: category.name.toString(),
          id: id,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: const Color.fromARGB(255, 15, 137, 202),
        actions: [
          IconButton(
            onPressed:(){ onOrder(id);
    },
            icon: Icon(
              Icons.add_box_rounded,
              color: Color.fromARGB(255, 250, 226, 92),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      drawer: Drawer1(token,id),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              'Categories of medications in the repository :',
              style: GoogleFonts.acme(
                fontSize: 30,
                color: const Color.fromARGB(255, 72, 146, 185),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchCategories(),
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
                  return GridView(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 30),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 40,
                            mainAxisSpacing: 40),
                    children: [
                      for (final m in model)
                        CustomGridofsquares(
                            categories: m,
                            onSelectCategory: () {
                              _selectCategory(context, m);
                            }),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

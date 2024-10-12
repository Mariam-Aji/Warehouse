import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:project_basics/models/model_categiory.dart';

class CustomGridofsquares extends StatelessWidget {
  const CustomGridofsquares(
      {super.key, required this.categories, required this.onSelectCategory});
  final ModelCategiory categories;
  final void Function() onSelectCategory;
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onSelectCategory,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 12, 123, 183),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(
            categories.name.toString(),
            style: GoogleFonts.adamina(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}

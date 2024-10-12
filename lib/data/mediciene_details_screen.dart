import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_basics/models/model_medicine.dart';

class MedicieneDetailsScerrn extends StatelessWidget {
  MedicieneDetailsScerrn({super.key, required this.med});
  final ModelMedicine med;

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(med.commercialName.toString()),
          backgroundColor: const Color.fromARGB(255, 15, 137, 202),
        ),
        body: Center(
          child: Column(

            children: [
              Image.network(
                'http://192.168.1.105:8000/${med.image}',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Information......',
                style: GoogleFonts.kanit(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 250, 226, 92),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Scientific Name:  ' + med.scientificName.toString(),
                style: GoogleFonts.kanit(
                  fontSize: 23,
                  color: const Color.fromARGB(255, 12, 123, 183),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Commercial Name:  ' + med.commercialName.toString(),
                style: GoogleFonts.kanit(
                  fontSize: 23,
                  color: const Color.fromARGB(255, 12, 123, 183),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Manufacture Company: ' + med.manufactureCompany.toString(),
                style: GoogleFonts.kanit(
                    fontSize: 23,
                    color: const Color.fromARGB(255, 12, 123, 183),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Available Quantity:  ' + med.availableQuantity.toString(),
                style: GoogleFonts.kanit(
                    fontSize: 23,
                    color: const Color.fromARGB(255, 12, 123, 183),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Expiry Date: ' + med.expiryDate.toString(),
                style: GoogleFonts.kanit(
                    fontSize: 23,
                    color: const Color.fromARGB(255, 12, 123, 183),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                ' Price: ' + med.price.toString(),
                style: GoogleFonts.kanit(
                    fontSize: 23,
                    color: const Color.fromARGB(255, 12, 123, 183),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Category: ' + med.category.toString(),
                style: GoogleFonts.kanit(
                    fontSize: 23,
                    color: const Color.fromARGB(255, 12, 123, 183),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Warehouse: ' + med.warehouse.toString(),
                style: GoogleFonts.kanit(
                    fontSize: 23,
                    color: const Color.fromARGB(255, 12, 123, 183),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_basics/models/model_medicine.dart';
import 'package:transparent_image/transparent_image.dart';

class MedicieneItem extends StatelessWidget {
  const MedicieneItem(
      {super.key, required this.medicine, required this.OnSelectedMediciene});
  final ModelMedicine medicine;
  final void Function(ModelMedicine med) OnSelectedMediciene;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: GestureDetector(
        onTap: () {
          OnSelectedMediciene(medicine);
        },
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage('http://192.168.1.105:8000/${medicine.image}'),
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Color.fromARGB(255, 250, 226, 92),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        medicine.commercialName.toString(),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.acme(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 15, 137, 202),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

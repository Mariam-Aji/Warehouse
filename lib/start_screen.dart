import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.log, this.register, {super.key});
  final void Function() log;
  final void Function() register;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/ph-logo.png',
          ),
          const SizedBox(
            height: 120,
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(40)),
              ElevatedButton(
                onPressed: log,
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
                  style: GoogleFonts.exo2(fontSize: 15),
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              ElevatedButton(
                onPressed: register,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    backgroundColor: const Color.fromARGB(255, 15, 137, 202),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
                child: Text(
                  'Register',
                  style: GoogleFonts.exo2(fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

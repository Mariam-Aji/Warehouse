import 'package:flutter/material.dart';
import 'package:project_basics/register_screen.dart';
import 'package:project_basics/start_screen.dart';
import 'package:project_basics/login_screen.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({super.key});
  @override
  State<Pharmacy> createState() {
    return _PharmacyState();
  }
}

class _PharmacyState extends State<Pharmacy> {
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartScreen(log, register);
    super.initState();
  }

  void register() {
    setState(() {
      activeScreen =const RegisterScreen();
    });
  }

  void log() {
    setState(() {
      activeScreen = const LoginScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}

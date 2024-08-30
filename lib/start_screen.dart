import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.nextScreen, {super.key});

  final void Function() nextScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display quiz image
          Image.asset(
            'assets/images/quiz-logo.png',
            //'assets/images/ArogyaCLogo.png',
            width: 500,
            height: 500,
            //color: const Color.fromARGB(125, 255, 255, 255),
          ),
          const SizedBox(height: 10),
          // Display welcome text
          Text('Learn Flutter the fun way!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              )),
          // add some space
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: nextScreen,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              foregroundColor: Colors.black,
            ),
            icon: const Icon(Icons.arrow_circle_right_outlined),
            label: const Text(
              'Start Quiz',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}

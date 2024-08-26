import 'package:flutter/material.dart';
import 'package:first_quiz/start_screen.dart';
import 'package:first_quiz/question_screen.dart';

// Variable declaration
var listColor = [Colors.deepOrangeAccent, Colors.deepPurpleAccent];
var beginColorAlign = Alignment.topLeft;
var endColorAlign = Alignment.bottomRight;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      //activeScreen = const QuestionScreen();
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = const QuestionScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: listColor,
                  begin: beginColorAlign,
                  end: endColorAlign)),
          child: screenWidget,
        ),
      ),
    );
  }
}

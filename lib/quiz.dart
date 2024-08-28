import 'package:first_quiz/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_quiz/start_screen.dart';
import 'package:first_quiz/question_screen.dart';
import 'package:first_quiz/data/questions.dart';

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
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  void homePage() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        restartQuizScreen: restartQuiz,
        homePage: homePage,
      );
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

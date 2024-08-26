import 'package:flutter/material.dart';
import "package:first_quiz/answer_button.dart";
import 'package:first_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(
                answerText: answer, onAnswerPress: answerQuestion);
          }),
          // AnswerButton(
          //     onAnswerPres: () {}, answerText: currentQuestion.answers[0]),
          // AnswerButton(
          //     onAnswerPres: () {}, answerText: currentQuestion.answers[1]),
          // AnswerButton(
          //     onAnswerPres: () {}, answerText: currentQuestion.answers[2]),
          // AnswerButton(
          //     onAnswerPres: () {}, answerText: currentQuestion.answers[3]),
        ]),
      ),
    );

    // Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       // Display welcome text
    //       const StyledText('Do you like Flutter', Colors.black, 28.0),
    //       // add some space
    //       const SizedBox(height: 10),
    //       OutlinedButton.icon(
    //         onPressed: () {},
    //         style: OutlinedButton.styleFrom(
    //           padding: const EdgeInsets.all(10),
    //           foregroundColor: Colors.black,
    //           //backgroundColor: Colors.deepOrangeAccent,
    //         ),
    //         icon: const Icon(Icons.arrow_circle_right_outlined),
    //         label: const Text(
    //           'Start Quiz',
    //           style: TextStyle(fontSize: 20.0),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

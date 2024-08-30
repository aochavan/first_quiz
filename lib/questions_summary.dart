import 'package:flutter/material.dart';
import 'package:first_quiz/question_identifier.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  bool compareAnswers(Map<String, Object> data) {
    if (data['correct_answer'] == data['user_answer']) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionIdentifier(
                    isCorrectAnswer: compareAnswers(data),
                    questionIndex: ((data['question_index'] as int)),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            (data['question']) as String,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            (data['correct_answer']).toString(),
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            (data['user_answer']).toString(),
                            style: const TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

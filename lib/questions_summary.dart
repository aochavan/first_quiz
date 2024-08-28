import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  FilledButton.icon(
                      onPressed: () {},
                      label: Text(
                        ((data['question_index'] as int) + 1).toString(),
                      )),
                  Expanded(
                    child: Column(children: [
                      const SizedBox(height: 5),
                      Text(
                        (data['question']) as String,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        (data['correct_answer']).toString(),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        (data['user_answer']).toString(),
                        textAlign: TextAlign.left,
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

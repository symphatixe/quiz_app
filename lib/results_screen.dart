import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswers, required this.restartScreen});
  final List<String> chosenAnswers;
  final void Function() restartScreen;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer' :questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data){
        return data['correct_answer'] == data['user_answer'];
      }
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(
                  color: Colors.black,
                  width: 2.5,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(
              height:30,
            ),

            QuestionsSummary(
              summaryData: getSummaryData()
            ),

            const SizedBox(
              height:30,
            ),

            OutlinedButton.icon(
              icon: const Icon(
                Icons.arrow_circle_right_outlined,
                size: 40,
                color: Colors.white,
              ),
              onPressed: restartScreen,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
              ),
              label: Text(
                "Restart Quiz",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String,Object>> summaryData;

  @override
  Widget build(context){
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map( (data) {
            final isCorrect = data['user_answer'] == data['correct_answer'];

              return Row(
                children:[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isCorrect ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      ((data['question_index'] as int) +1).toString(),
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children:[
                        Text(
                          data['question'] as String,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(
                          height:5,
                          ),

                        Text(
                          data['user_answer'] as String,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.greenAccent,
                          ),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          ).toList(),
        ),
      ),
    );
  }
}
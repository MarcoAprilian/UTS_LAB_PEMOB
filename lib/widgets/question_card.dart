import 'package:flutter/material.dart';
import '../models/quiz_model.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final int questionIndex;
  final Function(int selectedIndex) onAnswerSelected;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.questionIndex,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pertanyaan ${questionIndex + 1}',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),
          ),
          const SizedBox(height: 15),
          Text(
            question.questionText,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...question.options.asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2575FC), // Warna pilihan
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => onAnswerSelected(index),
                child: Text(
                  option,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

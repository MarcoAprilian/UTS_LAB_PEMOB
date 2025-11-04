import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../router/app_router.dart';
import '../widgets/question_card.dart';
import '../widgets/scaffold.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;

  void _answerQuestion(int selectedIndex) {
    final provider = Provider.of<QuizProvider>(context, listen: false);
    final currentQuestion = provider.questions[_currentQuestionIndex];

    if (selectedIndex == currentQuestion.correctAnswerIndex) {
      provider.incrementScore();
    }

    if (_currentQuestionIndex < provider.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      Navigator.of(context).pushReplacementNamed(AppRouter.scoreRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return QuizScaffold(
      title: 'Kuis ${_currentQuestionIndex + 1}/${quizProvider.questions.length}',
      showBackButton: false,
      child: Center(
        child: QuestionCard(
          question: quizProvider.questions[_currentQuestionIndex],
          questionIndex: _currentQuestionIndex,
          onAnswerSelected: _answerQuestion,
        ),
      ),
    );
  }
}

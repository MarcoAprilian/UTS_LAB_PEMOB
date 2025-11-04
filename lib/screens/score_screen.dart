import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../router/app_router.dart';
import '../widgets/reusable_button.dart';
import '../widgets/scaffold.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final score = quizProvider.playerScore.score;
    final totalQuestions = quizProvider.questions.length;
    final playerName = quizProvider.playerScore.playerName;

    return QuizScaffold(
      title: 'Hasil Kuis',
      showBackButton: false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/quizilus3.jpg'),
              ),
              const SizedBox(height: 30),

              Text(
                '$playerName',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),

              const Text(
                'Anda menjawab benar:',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                '$score / $totalQuestions',
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),

              ReusableButton(
                text: 'Main Lagi',
                onPressed: () {
                  quizProvider.resetQuiz();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRouter.homeRoute,
                        (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

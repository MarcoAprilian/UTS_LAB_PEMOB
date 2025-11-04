import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/score_screen.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String quizRoute = '/quiz';
  static const String scoreRoute = '/score';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case quizRoute:t
        return MaterialPageRoute(builder: (_) => QuizScreen());
      case scoreRoute:
        return MaterialPageRoute(builder: (_) => const ScoreScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error: Rute tidak ditemukan!'),
            ),
          ),
        );
    }
  }
}

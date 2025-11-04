import 'package:flutter/material.dart';
import '../models/quiz_model.dart';

class QuizProvider with ChangeNotifier {
  final List<Question> _questions = const [
    Question("Apa ibukota Indonesia?", ["Jakarta", "Bandung", "Surabaya"], 0),
    Question("Siapa nama bapak proklamator Indonesia?", ["Soeharto", "Soekarno", "Jokowi"], 1),
    Question("Berapa hasil dari 7 x 8?", ["54", "56", "64"], 1),
    Question("Planet terdekat dari Matahari adalah?", ["Mars", "Venus", "Merkurius"], 2),
  ];

  final PlayerScore _playerScore = PlayerScore();

  List<Question> get questions => _questions;
  PlayerScore get playerScore => _playerScore;

  void setPlayerName(String name) {
    _playerScore.playerName = name;
    notifyListeners();
  }

  void incrementScore() {
    _playerScore.score++;
    notifyListeners();
  }

  void resetQuiz() {
    _playerScore.reset();
    notifyListeners();
  }
}

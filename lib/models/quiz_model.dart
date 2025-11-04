class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  const Question(this.questionText, this.options, this.correctAnswerIndex);
}

class PlayerScore {
  String playerName = '';
  int score = 0;

  void reset() {
    playerName = '';
    score = 0;
  }
}

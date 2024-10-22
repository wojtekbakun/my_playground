class AnsweredLetters {
  Map<int, String> userAnswer = {};

  String formatWord(String word) {
    String newWord = word;
    newWord = newWord.toUpperCase();
    newWord = newWord.replaceAll(' ', '+');
    return newWord;
  }

  Map<int, String> initAnswer(String formattedWord) {
    int length = formattedWord.length;

    for (int i = 0; i < length; i++) {
      if (formattedWord[i] == '+') {
        userAnswer[i] = '+';
      } else {
        userAnswer[i] = '';
      }
    }
    return userAnswer;
  }

  void addNewLetter(String letter) {
    for (int i = 0; i < userAnswer.length; i++) {
      if (userAnswer[i] == '+' || userAnswer[i] != '') {
        continue;
      } else {
        userAnswer[i] = letter;
        break;
      }
    }
  }

  void removeLetter(int index) {
    userAnswer[index] = '';
  }

  void printAnswer() {
    print(userAnswer);
  }
}

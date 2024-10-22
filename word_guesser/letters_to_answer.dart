class ToAnswerLetters {
  String formattedWord;
  ToAnswerLetters(this.formattedWord);

  Map<int, String> _toAnswer = {};

  void initToAnswer() {
    for (int i = 0; i < formattedWord.length; i++) {
      _toAnswer[i] = formattedWord[i];
    }
  }

  //!TODO remove letter by index
  void removeLetter(String letter) {
    _toAnswer.containsValue(letter)
        ? _toAnswer[
            _toAnswer.keys.firstWhere((key) => _toAnswer[key] == letter)] = ''
        : print('Letter not found');
  }

  void printToAnswer() {
    print(_toAnswer);
  }
}

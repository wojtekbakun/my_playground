import 'dart:io';

class WordGuesser {
  Map<int, String> _answer = {};

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
        _answer[i] = '+';
      } else {
        _answer[i] = '';
      }
    }
    return _answer;
  }

  void addNewLetter(String letter) {
    for (int i = 0; i < _answer.length; i++) {
      if (_answer[i] == '+' || _answer[i] != '') {
        continue;
      } else {
        _answer[i] = letter;
        break;
      }
    }
  }

  void removeLetter(int index) {
    _answer[index] = '';
  }

  void printAnswer() {
    print(_answer);
  }
}

void main() {
  //ask user for input:
  String? terminalInput = stdin.readLineSync();
  print('You entered: $terminalInput');

  WordGuesser wordGuesser = WordGuesser();
  final formattedWord = wordGuesser.formatWord(terminalInput ?? 'hello world');
  final answer = wordGuesser.initAnswer(formattedWord);
  print(answer);

  while (true) {
    print('click "r" to remove a letter\nclick "a" to add a letter');
    String? action = stdin.readLineSync();

    switch (action) {
      case 'r':
        print('Enter the index of the letter you want to remove: ');
        int? index = int.parse(stdin.readLineSync() ?? '');
        wordGuesser.removeLetter(index);
        wordGuesser.printAnswer();
        break;
      case 'a':
        print('Enter a letter: ');
        String? letter = stdin.readLineSync();
        wordGuesser.addNewLetter(letter ?? '');
        wordGuesser.printAnswer();
        break;
    }
  }
}

import 'dart:io';
import 'letters_answered.dart';
import 'letters_to_answer.dart';

void main() {
  //ask user for input:
  String? terminalInput = stdin.readLineSync();
  print('You entered: $terminalInput');

  AnsweredLetters answeredLetters = AnsweredLetters();
  final formattedWord =
      answeredLetters.formatWord(terminalInput ?? 'hello world');
  final answer = answeredLetters.initAnswer(formattedWord);
  print(answer);

  ToAnswerLetters toAnswer = ToAnswerLetters(formattedWord);
  toAnswer.initToAnswer();

  while (true) {
    print('click "r" to remove a letter\nclick "a" to add a letter');
    String? action = stdin.readLineSync();

    switch (action) {
      case 'r':
        print('Enter the index of the letter you want to remove: ');
        int? index = int.parse(stdin.readLineSync() ?? '');
        answeredLetters.removeLetter(index);
        answeredLetters.printAnswer();
        break;
      case 'a':
        print('Enter index of the letter: ');
        String? letter = stdin.readLineSync();
        answeredLetters.addNewLetter(letter ?? '');
        toAnswer.removeLetter(letter ?? '');
        answeredLetters.printAnswer();
        break;
    }
    toAnswer.printToAnswer();
  }
}

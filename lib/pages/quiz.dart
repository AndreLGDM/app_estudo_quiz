import 'package:app3_estudo_quiz/data/questions.dart';
import 'package:app3_estudo_quiz/pages/questions_screen.dart';
import 'package:app3_estudo_quiz/pages/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:app3_estudo_quiz/pages/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  ///chooseAnwer === escolher uma resposta das disponiveis / logo em seguida armazena
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : activeScreen == 'questions-screen'
            ? QuestionsScreen(onSelectAnswer: chooseAnswer)
            : ResultsScreen(restartQuiz, chosenAnswers: selectedAnswers);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: startAlignment,
              end: endAlignment,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

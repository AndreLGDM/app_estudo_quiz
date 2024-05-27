import 'package:flutter/material.dart';
import 'package:app3_estudo_quiz/models/answer_button.dart';
import 'package:app3_estudo_quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  ///onSelectAnswer === Ao selecionar resposta, o que acontece ao ser selecionada
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  ///"answerQuestion" == responder à pergunta(O que ocorre após uma pergunta ser respondida)
  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentsQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentsQuestion.text,
              style: const TextStyle(
                fontFamily: 'Jacquard',
                fontSize: 26,
                color: Color.fromARGB(255, 201, 153, 251),
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            ...currentsQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}

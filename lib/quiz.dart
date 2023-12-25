import "package:flutter/material.dart";
import "package:flutter_course/data/questions.dart";
import "package:flutter_course/questions_screen.dart";
import "package:flutter_course/results_screen.dart";
import "package:flutter_course/start_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen({String screen = 'start-screen'}) {
    if (screen == 'start-screen') {
      selectedAnswers.clear();
    }

    setState(() {
      activeScreen = screen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      switchScreen(screen: 'results-screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(
      () => switchScreen(screen: 'questions-screen'),
    );

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: switchScreen,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 73, 4, 113),
                Color.fromARGB(255, 62, 8, 150),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

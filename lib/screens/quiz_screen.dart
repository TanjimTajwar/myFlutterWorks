import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';
import '../widgets/custom_textfield.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  static const routeName = '/quiz';

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _answerController = TextEditingController();
  final _random = Random();

  late int _a;
  late int _b;

  int _score = 0;
  String _feedback = '';
  Color _feedbackColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  void _generateQuestion() {
    _a = _random.nextInt(25) + 1;
    _b = _random.nextInt(25) + 1;
  }

  void _submitAnswer() {
    final answerText = _answerController.text.trim();

    if (answerText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please write an answer.')),
      );
      return;
    }

    final answer = int.tryParse(answerText);

    if (answer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid number.')),
      );
      return;
    }

    final correctAnswer = _a + _b;
    final isCorrect = answer == correctAnswer;

    setState(() {
      if (isCorrect) {
        _score++;
        _feedback = 'Correct! 🎉';
        _feedbackColor = Colors.greenAccent;
      } else {
        _feedback = 'Wrong! Ans: $correctAnswer';
        _feedbackColor = Colors.redAccent;
      }

      _answerController.clear();
      _generateQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text('Math Quiz'),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0A0F24),
              Color(0xFF1A1F3A),
              Color(0xFF2C2F6B),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // 🔥 HEADER
              const CustomCard(
                title: "Math Challenge",
                icon: Icons.quiz,
                child: Text(
                  "Solve problems and increase your score!",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 16),

              // 🎯 SCORE CARD
              CustomCard(
                child: Center(
                  child: Text(
                    "Score: $_score",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ❓ QUESTION
              CustomCard(
                child: Column(
                  children: [
                    const Text(
                      "Solve",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      "$_a + $_b = ?",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 16),

                    CustomTextField(
                      controller: _answerController,
                      hintText: 'Enter answer',
                      icon: Icons.calculate,
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitAnswer,
                        child: const Text('Submit Answer'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ✨ FEEDBACK
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _feedback.isEmpty
                    ? const SizedBox()
                    : CustomCard(
                        key: ValueKey(_feedback),
                        child: Center(
                          child: Text(
                            _feedback,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: _feedbackColor,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
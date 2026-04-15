import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';
import '../widgets/custom_textfield.dart';

class ReverseScreen extends StatefulWidget {
  const ReverseScreen({super.key});
  static const routeName = '/reverse';

  @override
  State<ReverseScreen> createState() => _ReverseScreenState();
}

class _ReverseScreenState extends State<ReverseScreen> {
  final _controller = TextEditingController();
  String _reversedText = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _reverse() {
    final text = _controller.text.trim();

    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a text.')),
      );
      return;
    }

    setState(() {
      _reversedText = text.split('').reversed.join();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text('Reverse String'),
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
                title: "Reverse Your Text",
                icon: Icons.swap_horiz,
                child: Text(
                  "Enter any text and see it reversed instantly.",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 16),

              // 📥 INPUT + BUTTON
              CustomCard(
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _controller,
                      hintText: 'Type text to reverse',
                      icon: Icons.text_fields,
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _reverse,
                        child: const Text('Reverse'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🔁 RESULT WITH ANIMATION
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: CustomCard(
                  key: ValueKey(_reversedText),
                  title: "Result",
                  icon: Icons.auto_awesome,
                  child: Center(
                    child: _reversedText.isEmpty
                        ? const Text(
                            "Reversed text will appear here",
                            style: TextStyle(color: Colors.white54),
                          )
                        : Column(
                            children: [
                              const Text(
                                "Reversed Text",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),

                              // 💎 STYLED OUTPUT BOX
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF6C63FF),
                                      Color(0xFF00E5FF),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  _reversedText,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
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
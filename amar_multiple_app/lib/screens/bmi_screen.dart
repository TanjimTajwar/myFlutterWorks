import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';
import '../widgets/custom_textfield.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});
  static const routeName = '/bmi';

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  double? _bmi;
  String _category = '';

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _calculate() {
    final hText = _heightController.text.trim();
    final wText = _weightController.text.trim();

    if (hText.isEmpty || wText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields.')),
      );
      return;
    }

    final heightCm = double.tryParse(hText);
    final weight = double.tryParse(wText);

    if (heightCm == null || weight == null || heightCm <= 0 || weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter valid values.')),
      );
      return;
    }

    final heightM = heightCm / 100;
    final bmi = weight / (heightM * heightM);

    String category;
    if (bmi < 18.5) {
      category = 'Underweight';
    } else if (bmi < 25) {
      category = 'Normal';
    } else if (bmi < 30) {
      category = 'Overweight';
    } else {
      category = 'Obese';
    }

    setState(() {
      _bmi = bmi;
      _category = category;
    });
  }

  Color get _categoryColor {
    switch (_category) {
      case 'Underweight':
        return Colors.orange;
      case 'Normal':
        return Colors.green;
      case 'Overweight':
        return Colors.deepOrange;
      case 'Obese':
        return Colors.red;
      default:
        return Colors.white70;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text('BMI Calculator'),
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
                title: "Check Your BMI",
                icon: Icons.favorite,
                child: Text(
                  "Calculate your Body Mass Index easily.",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 16),

              // 📥 INPUT CARD
              CustomCard(
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _heightController,
                      hintText: 'Height (cm)',
                      icon: Icons.height,
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextField(
                      controller: _weightController,
                      hintText: 'Weight (kg)',
                      icon: Icons.monitor_weight,
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _calculate,
                        child: const Text('Calculate BMI'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🎯 RESULT
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: CustomCard(
                  key: ValueKey(_bmi),
                  title: "Your Result",
                  icon: Icons.auto_graph,
                  child: _bmi == null
                      ? const Center(
                          child: Text(
                            "Result will appear here",
                            style: TextStyle(color: Colors.white54),
                          ),
                        )
                      : Column(
                          children: [
                            // BMI VALUE
                            Text(
                              _bmi!.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 6),

                            // CATEGORY
                            Text(
                              _category,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _categoryColor,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // PROGRESS BAR STYLE INDICATOR
                            LinearProgressIndicator(
                              value: (_bmi! / 40).clamp(0, 1),
                              backgroundColor: Colors.white12,
                              valueColor: AlwaysStoppedAnimation(_categoryColor),
                              minHeight: 8,
                            ),
                          ],
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
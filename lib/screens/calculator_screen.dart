import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  static const routeName = '/calculator';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();

  String _resultText = 'Result: 0';

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  void _calculate(String operation) {
    final a = double.tryParse(_firstController.text.trim());
    final b = double.tryParse(_secondController.text.trim());

    if (a == null || b == null) {
      setState(() {
        _resultText = 'Result: Please enter valid numbers';
      });
      return;
    }

    double value;
    switch (operation) {
      case '+':
        value = a + b;
        break;
      case '-':
        value = a - b;
        break;
      case '*':
        value = a * b;
        break;
      case '/':
        if (b == 0) {
          setState(() {
            _resultText = 'Result: Cannot divide by zero';
          });
          return;
        }
        value = a / b;
        break;
      default:
        return;
    }

    setState(() {
      _resultText = 'Result: ${value.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Calculator'),
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _firstController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'First number',
                    prefixIcon: Icon(Icons.looks_one),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _secondController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Second number',
                    prefixIcon: Icon(Icons.looks_two),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _OperationButton(
                      label: '+',
                      onTap: () => _calculate('+'),
                    ),
                    _OperationButton(
                      label: '-',
                      onTap: () => _calculate('-'),
                    ),
                    _OperationButton(
                      label: '*',
                      onTap: () => _calculate('*'),
                    ),
                    _OperationButton(
                      label: '/',
                      onTap: () => _calculate('/'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  _resultText,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OperationButton extends StatelessWidget {
  const _OperationButton({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

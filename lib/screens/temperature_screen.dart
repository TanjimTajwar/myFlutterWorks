import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';
import '../widgets/custom_textfield.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});
  static const routeName = '/temperature';

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final _controller = TextEditingController();
  double? _fahrenheit;
  bool _loading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _convert() async {
    if (_controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter Celsius value.')),
      );
      return;
    }

    final c = double.tryParse(_controller.text.trim());
    if (c == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid number.')),
      );
      return;
    }

    setState(() => _loading = true);

    await Future<void>.delayed(const Duration(milliseconds: 400));

    setState(() {
      _fahrenheit = (c * 9 / 5) + 32;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text('Temperature Converter'),
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
              // 🔥 HEADER CARD
              const CustomCard(
                title: "Celsius to Fahrenheit",
                icon: Icons.thermostat,
                child: Text(
                  "Convert temperature easily with instant results.",
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
                      hintText: 'Enter Celsius',
                      icon: Icons.thermostat_outlined,
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _loading ? null : _convert,
                        child: _loading
                            ? const SizedBox(
                                height: 22,
                                width: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Convert'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🎯 RESULT CARD
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: CustomCard(
                  key: ValueKey(_fahrenheit),
                  title: "Result",
                  icon: Icons.auto_awesome,
                  child: Center(
                    child: _fahrenheit == null
                        ? const Text(
                            "Result will appear here",
                            style: TextStyle(color: Colors.white54),
                          )
                        : Column(
                            children: [
                              const Text(
                                "Fahrenheit",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "${_fahrenheit!.toStringAsFixed(2)} °F",
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
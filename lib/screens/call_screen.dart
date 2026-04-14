import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';
import '../widgets/custom_textfield.dart';
import 'fake_call_screen.dart'; // 👈 import added

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});
  static const routeName = '/call';

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final _numberController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  // 🔥 UPDATED CALL FUNCTION
  Future<void> _call() async {
    final number = _numberController.text.trim();

    if (number.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a phone number.')),
      );
      return;
    }

    // 👉 OPEN FAKE CALL SCREEN
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FakeCallScreen(name: "Arnab"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text('Phone Call'),
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
                title: "Make a Call",
                icon: Icons.phone,
                child: Text(
                  "Enter a number and simulate a call experience.",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 16),

              // 📥 INPUT + BUTTON
              CustomCard(
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _numberController,
                      hintText: 'Enter phone number',
                      icon: Icons.call,
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _call,
                        icon: const Icon(Icons.call),
                        label: const Text('Call Now'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
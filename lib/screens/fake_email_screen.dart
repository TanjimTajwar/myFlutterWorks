import 'package:flutter/material.dart';

class FakeEmailScreen extends StatelessWidget {
  final String sender;

  const FakeEmailScreen({super.key, required this.sender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.email, size: 100, color: Colors.white),
          const SizedBox(height: 20),

          Text(
            "You got a mail from $sender",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 50),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Email Opened")),
                  );
                },
                child: const Icon(Icons.mark_email_read),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
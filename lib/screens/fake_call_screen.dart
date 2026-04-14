import 'package:flutter/material.dart';

class FakeCallScreen extends StatelessWidget {
  final String name;

  const FakeCallScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle, size: 120, color: Colors.white),
          const SizedBox(height: 20),

          Text(
            "$name is calling...",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ❌ DECLINE
              FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.call_end),
              ),

              // ✅ ACCEPT
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Call Accepted")),
                  );
                },
                child: const Icon(Icons.call),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';
import '../widgets/custom_textfield.dart';

import 'fake_email_screen.dart';
class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});
  static const routeName = '/email';

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    final email = _emailController.text.trim();
    final subject = _subjectController.text.trim();
    final message = _messageController.text.trim();

    if (email.isEmpty || subject.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields.')),
      );
      return;
    }

    setState(() => _loading = true);

    await Future.delayed(const Duration(milliseconds: 400));

    if (!mounted) return;

    setState(() => _loading = false);

    // 🔥 SHOW FAKE EMAIL RECEIVED SCREEN
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FakeEmailScreen(sender: "Arnab"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text('Email Sender'),
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
                title: "Send an Email",
                icon: Icons.email,
                child: Text(
                  "Compose and simulate sending emails easily.",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 16),

              // 📥 INPUT
              CustomCard(
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Recipient email',
                      icon: Icons.alternate_email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      controller: _subjectController,
                      hintText: 'Email subject',
                      icon: Icons.subject,
                    ),
                    CustomTextField(
                      controller: _messageController,
                      hintText: 'Type your message',
                      icon: Icons.message,
                      maxLines: 4,
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _loading ? null : _sendEmail,
                        icon: _loading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(Icons.send),
                        label: Text(_loading ? 'Sending...' : 'Send Email'),
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
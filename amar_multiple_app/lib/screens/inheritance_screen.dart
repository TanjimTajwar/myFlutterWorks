import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';
import '../widgets/custom_textfield.dart';

class InheritanceScreen extends StatefulWidget {
  const InheritanceScreen({super.key});
  static const routeName = '/inheritance';

  @override
  State<InheritanceScreen> createState() => _InheritanceScreenState();
}

class _InheritanceScreenState extends State<InheritanceScreen> {
  final _sonsController = TextEditingController();
  final _daughtersController = TextEditingController();
  final _wealthController = TextEditingController();

  double? _sonShare;
  double? _daughterShare;

  @override
  void dispose() {
    _sonsController.dispose();
    _daughtersController.dispose();
    _wealthController.dispose();
    super.dispose();
  }

  void _calculate() {
    final sons = int.tryParse(_sonsController.text.trim()) ?? -1;
    final daughters = int.tryParse(_daughtersController.text.trim()) ?? -1;
    final wealth = double.tryParse(_wealthController.text.trim()) ?? -1;

    if (sons < 0 || daughters < 0 || wealth <= 0 || (sons + daughters == 0)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter valid values.')),
      );
      return;
    }

    final totalShares = (sons * 2) + daughters;
    final shareValue = wealth / totalShares;

    setState(() {
      _sonShare = shareValue * 2;
      _daughterShare = shareValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text('Inheritance Calculator'),
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
                title: "Inheritance Distribution",
                icon: Icons.account_balance,
                child: Text(
                  "Calculate fair shares based on Islamic rules.",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 16),

              // 📥 INPUT
              CustomCard(
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _sonsController,
                      hintText: 'Number of sons',
                      icon: Icons.boy,
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextField(
                      controller: _daughtersController,
                      hintText: 'Number of daughters',
                      icon: Icons.girl,
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextField(
                      controller: _wealthController,
                      hintText: 'Total wealth',
                      icon: Icons.payments,
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _calculate,
                        child: const Text('Calculate'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🎯 RESULT
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: (_sonShare == null || _daughterShare == null)
                    ? const CustomCard(
                        child: Center(
                          child: Text(
                            "Result will appear here",
                            style: TextStyle(color: Colors.white54),
                          ),
                        ),
                      )
                    : Column(
                        key: ValueKey(_sonShare),
                        children: [
                          // 👦 SON SHARE
                          CustomCard(
                            title: "Each Son Gets",
                            icon: Icons.boy,
                            child: Center(
                              child: Text(
                                _sonShare!.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          // 👧 DAUGHTER SHARE
                          CustomCard(
                            title: "Each Daughter Gets",
                            icon: Icons.girl,
                            child: Center(
                              child: Text(
                                _daughterShare!.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent,
                                ),
                              ),
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
import 'package:flutter/material.dart';

import 'bmi_screen.dart';
import 'calculator_screen.dart';
import 'call_screen.dart';
import 'email_screen.dart';
import 'inheritance_screen.dart';
import 'quiz_screen.dart';
import 'reverse_screen.dart';
import 'temperature_screen.dart';
import 'todo_screen.dart';
import 'zakah_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final features = <_FeatureItem>[
      const _FeatureItem('Temperature', Icons.thermostat_rounded,
          TemperatureScreen.routeName, [Color(0xFF00E5FF), Color(0xFF00B0FF)]),
      const _FeatureItem('BMI', Icons.monitor_weight_rounded,
          BmiScreen.routeName, [Color(0xFFFFD54F), Color(0xFFFFA000)]),
      const _FeatureItem('Inheritance', Icons.account_balance_rounded,
          InheritanceScreen.routeName, [Color(0xFF7C4DFF), Color(0xFF512DA8)]),
      const _FeatureItem('Reverse', Icons.swap_horiz_rounded,
          ReverseScreen.routeName, [Color(0xFF26C6DA), Color(0xFF00838F)]),
      const _FeatureItem('Call', Icons.call_rounded, CallScreen.routeName,
          [Color(0xFFFF7043), Color(0xFFD84315)]),
      const _FeatureItem('Email', Icons.email_rounded, EmailScreen.routeName,
          [Color(0xFF42A5F5), Color(0xFF1565C0)]),
      const _FeatureItem('Quiz', Icons.quiz_rounded, QuizScreen.routeName,
          [Color(0xFFAB47BC), Color(0xFF6A1B9A)]),
      const _FeatureItem('Todo', Icons.checklist_rounded, TodoScreen.routeName,
          [Color(0xFF66BB6A), Color(0xFF2E7D32)]),
      const _FeatureItem('Calculator', Icons.calculate_rounded,
          CalculatorScreen.routeName, [Color(0xFF29B6F6), Color(0xFF0277BD)]),
      const _FeatureItem('Zakah', Icons.volunteer_activism_rounded,
          ZakahScreen.routeName, [Color(0xFF26A69A), Color(0xFF00695C)]),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Amar Multiple App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                // 🔥 HERO HEADER CARD
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF6C63FF),
                        Color(0xFF00E5FF),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6C63FF).withOpacity(0.4),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome 👋',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'All your tools in one beautiful app',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // 📱 LIST (one button per row)
                Expanded(
                  child: ListView.separated(
                    itemCount: features.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = features[index];

                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(context, item.route),
                        child: Container(
                          height: 86,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            gradient: LinearGradient(colors: item.colors),
                            boxShadow: [
                              BoxShadow(
                                color: item.colors.last.withOpacity(0.4),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(
                                1.5), // glass effect border
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.white.withOpacity(0.08),
                            ),

                            child: Row(
                              children: [
                                const SizedBox(width: 18),
                                Icon(
                                  item.icon,
                                  size: 34,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    item.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white70,
                                  size: 18,
                                ),
                                const SizedBox(width: 16),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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

class _FeatureItem {
  const _FeatureItem(this.title, this.icon, this.route, this.colors);

  final String title;
  final IconData icon;
  final String route;
  final List<Color> colors;
}

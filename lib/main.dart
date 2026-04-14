import 'package:flutter/material.dart';

import 'screens/bmi_screen.dart';
import 'screens/calculator_screen.dart';
import 'screens/call_screen.dart';
import 'screens/email_screen.dart';
import 'screens/home_screen.dart';
import 'screens/inheritance_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/reverse_screen.dart';
import 'screens/temperature_screen.dart';
import 'screens/todo_screen.dart';
import 'screens/zakah_screen.dart';

void main() {
  runApp(const AmarMultipleApp());
}

class AmarMultipleApp extends StatelessWidget {
  const AmarMultipleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6C63FF), // modern purple-blue
      brightness: Brightness.dark,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amar Multiple App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,

        // 🌌 BACKGROUND COLOR
        scaffoldBackgroundColor: const Color(0xFF0A0F24),

        // ✍️ TEXT STYLE
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFFB8C6FF),
          ),
        ),

        // 🔝 APPBAR (MODERN TRANSPARENT STYLE)
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        // 💳 CARD DESIGN (GLASS EFFECT)
        cardTheme: CardThemeData(
          color: Colors.white.withOpacity(0.05),
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        // 🔘 BUTTON DESIGN
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6C63FF),
            foregroundColor: Colors.white,
            elevation: 6,
            shadowColor: const Color(0xFF6C63FF).withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // 📥 INPUT FIELD DESIGN
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Color(0xFF6C63FF),
              width: 1.5,
            ),
          ),
          hintStyle: const TextStyle(color: Color(0xFF9FA8DA)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),

        // 🍞 SNACKBAR STYLE
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF1A1F3A),
          contentTextStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // 🧭 ROUTES
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        TemperatureScreen.routeName: (_) => const TemperatureScreen(),
        BmiScreen.routeName: (_) => const BmiScreen(),
        InheritanceScreen.routeName: (_) => const InheritanceScreen(),
        ReverseScreen.routeName: (_) => const ReverseScreen(),
        CallScreen.routeName: (_) => const CallScreen(),
        EmailScreen.routeName: (_) => const EmailScreen(),
        QuizScreen.routeName: (_) => const QuizScreen(),
        TodoScreen.routeName: (_) => const TodoScreen(),
        CalculatorScreen.routeName: (_) => const CalculatorScreen(),
        ZakahScreen.routeName: (_) => const ZakahScreen(),
      },

      initialRoute: HomeScreen.routeName,
    );
  }
}

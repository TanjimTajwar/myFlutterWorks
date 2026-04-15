import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.maxLines = 1,
    this.obscureText = false,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),

        // 🌈 GLASS BACKGROUND
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.06),
            Colors.white.withOpacity(0.02),
          ],
        ),

        // ✨ SOFT BORDER
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
        ),
      ),

      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        obscureText: obscureText,

        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),

        cursorColor: Theme.of(context).colorScheme.primary,

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF9FA8DA),
          ),

          // 🎯 ICON STYLE
          prefixIcon: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),

          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
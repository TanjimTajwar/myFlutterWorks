import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.title,
    this.icon,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),

        // 🌈 SOFT GRADIENT BACKGROUND
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.08),
            Colors.white.withOpacity(0.03),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        // 💎 GLOW BORDER
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
        ),

        // ✨ SHADOW
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2), // glass effect
          ),
          child: Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔝 OPTIONAL HEADER
                if (title != null) ...[
                  Row(
                    children: [
                      if (icon != null)
                        Icon(icon, color: Colors.white70, size: 20),
                      if (icon != null) const SizedBox(width: 8),
                      Text(
                        title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],

                // 📦 CONTENT
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
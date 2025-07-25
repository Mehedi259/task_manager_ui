import 'package:flutter/material.dart';

class CustomAuthScreenHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomAuthScreenHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 80),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 30,
            height: 1.26,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.43,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

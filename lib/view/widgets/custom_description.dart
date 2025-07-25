// lib/view/widgets/custom_description.dart
import 'package:flutter/material.dart';

class CustomDescriptionField extends StatelessWidget {
  final String label;
  final String hintText;
  const CustomDescriptionField({
    super.key,
    this.label = "Description",
    this.hintText = 'e.g. Include logo, navigation, and CTA button with brand color',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFF7FFEF),
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 24,
              )
            ],
          ),
          child: TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

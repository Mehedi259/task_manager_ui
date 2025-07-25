import 'package:flutter/material.dart';

class SuccessToster extends StatelessWidget {
  final String message;
  final VoidCallback onOkTap;

  const SuccessToster({
    super.key,
    required this.message,
    required this.onOkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 215,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Success icon
            Container(
              width: 48,
              height: 42.64,
              decoration: BoxDecoration(
                color: const Color(0xFFFBBF24), // Amber-400
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.check, color: Colors.white),
            ),
            const SizedBox(height: 10),

            // "Success" Text
            const Text(
              "Success",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
                height: 1.0,
                letterSpacing: -0.035, // -3.5%
              ),
            ),
            const SizedBox(height: 6),

            // Message Text
            SizedBox(
              width: 210,
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF475569), // Slate-600
                  height: 1.3,
                  letterSpacing: 0.02,
                ),
              ),
            ),
            const Spacer(),

            // OK Button
            SizedBox(
              width: 100,
              height: 32,
              child: ElevatedButton(
                onPressed: onOkTap,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  backgroundColor: const Color(0xFF84C000), // Brand Color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'OK',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.14, // 16/14
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

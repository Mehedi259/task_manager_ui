import 'package:flutter/material.dart';

class WarningToster extends StatelessWidget {
  final String message;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const WarningToster({
    super.key,
    required this.message,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 260,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Warning icon
            Container(
              width: 48,
              height: 42.6,
              decoration: BoxDecoration(
                color: const Color(0xFFFBBF24), // Amber-400
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(Icons.warning_amber_rounded,
                  color: Colors.white, size: 30),
            ),
            const SizedBox(height: 10),

            // "Warning" text
            const Text(
              "Warning",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 1.0,
                letterSpacing: -0.035,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Message
            Text(
              message,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF475569), // Slate-600
                height: 1.3,
                letterSpacing: 0.02,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cancel
                OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        color: Color(0xFF84C000)), // Brand Color
                    minimumSize: const Size(100, 32),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xFF84C000), // Brand Color
                    ),
                  ),
                ),

                // Confirm
                ElevatedButton(
                  onPressed: onConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF84C000), // Brand Color
                    minimumSize: const Size(100, 32),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

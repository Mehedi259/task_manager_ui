import 'package:flutter/material.dart';
import '../../widgets/custom_points.dart';
import '../../widgets/custom_nav.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ App Bar
      appBar: AppBar(
        title: const Text(
          'Privacy policy',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      // ✅ Body with Scrollable Points
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomPoint(
              title: "Privacy Policy – Task Manager App",
              description:
              "Welcome to the Task Manager App. By accessing or using this application, you agree to the following terms and conditions:",
            ),
            CustomPoint(
              title: "1. Information Collection",
              description:
              "This app is designed to help users create, manage, and track personal or professional tasks efficiently. By using the app, you agree to use it responsibly and only for lawful purposes.",
            ),
            CustomPoint(
              title: "2. Local Storage",
              description:
              "All tasks, notes, and other information entered by the user are stored securely. While we strive to maintain accurate task management functionality, the app is not responsible for missed deadlines, incorrect entries, or user-generated errors.",
            ),
            CustomPoint(
              title: "3. No Tracking",
              description:
              "Users are solely responsible for managing their tasks, reminders, and any personal or professional outcomes related to the completion or non-completion of tasks created within the app..",
            ),
            CustomPoint(
              title: "4. Static Data Display",
              description:
              "Users are solely responsible for managing their tasks, reminders, and any personal or professional outcomes related to the completion or non-completion of tasks created within the app..",
            ),
            CustomPoint(
              title: "5. Third-Party Services",
              description:
              "Users are solely responsible for managing their tasks, reminders, and any personal or professional outcomes related to the completion or non-completion of tasks created within the app..",
            ),
          ],
        ),
      ),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: const CustomNavBar(currentIndex: 2),
    );
  }
}

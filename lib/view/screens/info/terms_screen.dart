import 'package:flutter/material.dart';
import '../../widgets/custom_points.dart';
import '../../widgets/custom_nav.dart';
import '../../widgets/custom_userflow_topbar.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(currentIndex: 2),
      body: SafeArea(
        child: Column(
          children: [
            const CustomUserFlowTopBar(
              title: 'Terms and Conditions', text: '',
            ),
            const SizedBox(height: 32),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomPoint(
                      title: "Terms & Conditions",
                      description:
                      "Welcome to the Task Manager App. By accessing or using this application, you agree to the following terms and conditions:",
                    ),
                    CustomPoint(
                      title: "1. Use of the App",
                      description:
                      "This app is designed to help users create, manage, and track personal or professional tasks efficiently. By using the app, you agree to use it responsibly and only for lawful purposes.",
                    ),
                    CustomPoint(
                      title: "2. Accuracy of Information",
                      description:
                      "All tasks, notes, and other information entered by the user are stored securely. While we strive to maintain accurate task management functionality, the app is not responsible for missed deadlines, incorrect entries, or user-generated errors.",
                    ),
                    CustomPoint(
                      title: "3. User Responsibility",
                      description:
                      "Users are solely responsible for managing their tasks, reminders, and any personal or professional outcomes related to the completion or non-completion of tasks created within the app.",
                    ),
                    CustomPoint(
                      title: "4. Data Collection",
                      description:
                      "Users are solely responsible for managing their tasks, reminders, and any personal or professional outcomes related to the completion or non-completion of tasks created within the app.",
                    ),
                    CustomPoint(
                      title: "5. Limitation of Liability",
                      description:
                      "Users are solely responsible for managing their tasks, reminders, and any personal or professional outcomes related to the completion or non-completion of tasks created within the app.",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

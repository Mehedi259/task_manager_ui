import 'package:flutter/material.dart';
import '../../widgets/custom_points.dart';
import '../../widgets/custom_nav.dart';
import '../../widgets/custom_userflow_topbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(currentIndex: 2),
      body: SafeArea(
        child: Column(
          children: [
            const CustomUserFlowTopBar(
              title: 'Privacy Policy',
              text: '',
            ),
            const SizedBox(height: 32),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                      "We do not track any personal user data or behavior inside the app. All your information remains on your device.",
                    ),
                    CustomPoint(
                      title: "4. Static Data Display",
                      description:
                      "The data you enter is stored locally and used solely for your task organization. No data is sent to external servers.",
                    ),
                    CustomPoint(
                      title: "5. Third-Party Services",
                      description:
                      "The app does not integrate with any third-party services that may collect or track user data.",
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

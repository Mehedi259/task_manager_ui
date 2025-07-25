import 'package:flutter/material.dart';
import 'package:task_manager_ui/view/widgets/custom_userflow_topbar.dart';
import '../../widgets/custom_nav.dart';
import '../../widgets/ExpansionTile.dart';


class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomUserFlowTopBar(title: 'Help/Support', text: '',),
              const SizedBox(height: 24),
              const Text(
                'FAQs',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFF2A2A2A),
                ),
              ),
              const SizedBox(height: 16),
              const CustomExpansionTile(
                title: 'How do I create a new task?',
                description:
                'Tap the "Add Task" button on the navigation bar. Fill in the task title, due date, priority, and other details — then tap "Save".',
              ),
              const CustomExpansionTile(
                title: 'How can I view task details?',
                description:
                'The Task Manager App may collect limited information such as your name.',
              ),
              const CustomExpansionTile(
                title: 'Can I mark a task as favorite or important?',
                description:
                'email address, and preferences — strictly for the purpose of enhancing your task management experience. We do not collect sensitive personal information unnecessarily.',
              ),
              const CustomExpansionTile(
                title: 'How do I edit or delete a task?',
                description:
                'We do not collect sensitive personal information unnecessarily.',
              ),
              const CustomExpansionTile(
                title: 'Is my data secure?',
                description:
                'Tap the "Add Task" button on the navigation bar. Fill in the task title, due date, priority, and other details — then tap "Save".',
              ),
              const SizedBox(height: 32),
              const Text(
                'Need More Help?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFF2A2A2A),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 24,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: const BoxDecoration(
                        color: Color(0xFF84C000),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.headset_mic_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Mail Us: ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xFF2A2A2A),
                            ),
                          ),
                          Text(
                            'support@taskmanagerapp.com',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xFF84C000),
                            ),
                          ),

                          SizedBox(height: 6),
                          Text(
                            'Our help desk is available 24/7 to support your workflow.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF555555),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 2),
    );
  }
}

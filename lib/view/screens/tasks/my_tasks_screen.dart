import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../../widgets/customTask.dart';
import '../../widgets/custom_nav.dart';

class MyTaskScreen extends StatelessWidget {
  const MyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskList = [
      {
        'title': 'Design Landing Page Header',
        'description':
        'Create a clean, responsive header section with logo, navigation links, and a clear call-to-action button.',
        'image': Assets.images.img1,
        'icon': Assets.icons.icon,
      },
      {
        'title': 'Develop Onboarding Screens',
        'description':
        'Design a 3-step onboarding flow to introduce users to core app features using illustrations and concise text.',
        'image': Assets.images.img1,
        'icon': Assets.icons.icon,
      },
      {
        'title': 'Organize Task Card Components',
        'description':
        'Build reusable task card UI elements for listing, prioritizing, and editing individual tasks.',
        'image': Assets.images.img1,
        'icon': Assets.icons.icon,
      },
      {
        'title': 'Prepare Terms & Privacy Pages',
        'description':
        'Create UI layouts for Terms & Conditions and Privacy Policy using scrollable content and soft brand styling.',
        'image': Assets.images.img1,
        'icon': Assets.icons.icon,
      },
      {
        'title': 'Build Calendar View Layout',
        'description':
        'Design a visual calendar interface to display upcoming tasks and deadlines with status indicators.',
        'image': Assets.images.img1,
        'icon': Assets.icons.icon,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 52),

          // Top Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0x8022C228), width: 0.1),
                    image: DecorationImage(
                      image: Assets.images.img.provider(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hello Mojahid',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Welcome to Task Manager',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'My Tasks',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Task List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final task = taskList[index];
                return CustomTaskCard(
                  title: task['title'] as String,
                  description: task['description'] as String,
                  image: task['image'] as AssetGenImage,
                  icon: task['icon'] as AssetGenImage,
                );
              },
            ),
          ),

          // Bottom Navigation Bar
          const CustomNavBar(currentIndex: 0),
        ],
      ),
    );
  }
}

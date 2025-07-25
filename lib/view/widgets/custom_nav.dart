import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/tasks/add_task_screen.dart';
import '../screens/tasks/my_tasks_screen.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomNavBar({super.key, required this.currentIndex});

  void _onTap(int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Get.offAll(() => const MyTaskScreen());
        break;
      case 1:
        Get.offAll(() => const AddTaskScreen());
        break;
      case 2:
        Get.offAll(() => const ProfileScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox(
        height: 90,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Background Bar
            Container(
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  currentIndex == 0
                      ? const SizedBox(width: 64)
                      : _buildButton(icon: Icons.home, label: "My Tasks", index: 0),
                  currentIndex == 1
                      ? const SizedBox(width: 64)
                      : _buildButton(icon: Icons.add, label: "Add Task", index: 1),
                  currentIndex == 2
                      ? const SizedBox(width: 64)
                      : _buildButton(icon: Icons.person, label: "Profile", index: 2),
                ],
              ),
            ),

            // Floating active button
            Positioned(
              bottom: 12,
              left: currentIndex == 0
                  ? MediaQuery.of(context).size.width * 0.13
                  : currentIndex == 1
                  ? MediaQuery.of(context).size.width * 0.5 - 32
                  : MediaQuery.of(context).size.width * 0.87 - 64,
              child: GestureDetector(
                onTap: () => _onTap(currentIndex),
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFF84C000),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(width: 6, color: Colors.white),
                  ),
                  child: Icon(
                    currentIndex == 0
                        ? Icons.home
                        : currentIndex == 1
                        ? Icons.add
                        : Icons.person,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => _onTap(index),
      child: Container(
        width: 64,
        height: 64,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: Colors.black),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF1E293B),
                fontFamily: 'Figtree',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

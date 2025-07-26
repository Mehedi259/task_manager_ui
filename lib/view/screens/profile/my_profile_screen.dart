import 'package:flutter/material.dart';
import 'package:task_manager_ui/view/screens/profile/account_settings_screen.dart';
import 'package:task_manager_ui/view/screens/profile/change_password_screen.dart';
import 'package:task_manager_ui/view/screens/profile/edit_profile_screen.dart';
import '../../../gen/assets.gen.dart';
import '../../widgets/custom_nav.dart';
import '../../widgets/hexagonClipper.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: const CustomNavBar(currentIndex: 2),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 52),

            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  // Back Button with back.png
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Assets.icons.back.path,
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "My Profile",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  // Edit icon (profile_edit.png)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Assets.icons.profileEdit.path,
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Profile Image & Name
            Container(
              width: 358,
              height: 136,
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  ClipPath(
                    clipper: HexagonClipper(),
                    child: Container(
                      width: 80,
                      height: 95,
                      child: Image.asset(
                        Assets.images.img2.path,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Mojahid",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      height: 1,
                      color: Color(0xFF232323),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            infoRow(iconPath: Assets.icons.profileIcon.path, text: "Mojahid Islam"),
            const SizedBox(height: 12),

            infoRow(iconPath: Assets.icons.email.path, text: "Samaltman@gmail.com"),
            const SizedBox(height: 12),

            infoRow(iconPath: Assets.icons.location.path, text: "1234 Elm Street, Springfield, IL"),
          ],
        ),
      ),
    );
  }

  // Reusable Info Row with 40x40 icon
  Widget infoRow({required String iconPath, required String text}) {
    return Container(
      width: double.infinity,
      height: 52,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 10),
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
              width: 40,
              height: 40,
            ),
          ),
          const Text("|", style: TextStyle(color: Color(0xFF84C000), fontSize: 18)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.2,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

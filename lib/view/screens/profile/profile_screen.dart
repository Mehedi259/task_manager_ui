import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_ui/view/screens/profile/account_settings_screen.dart';
import 'package:task_manager_ui/view/screens/profile/my_profile_screen.dart';
import '../../../gen/assets.gen.dart';
import '../../widgets/hexagonClipper.dart';
import '../../widgets/custom_nav.dart';
import '../info/help_support_screen.dart';
import '../info/privacy_policy_screen.dart';
import '../info/terms_screen.dart';
import '../../widgets/WarningToster.dart';
import '../../widgets/SuccessToster.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showOverlay = false;
  Widget _overlayWidget = const SizedBox();

  void _showCustomOverlay(Widget child) {
    setState(() {
      _showOverlay = true;
      _overlayWidget = child;
    });
  }

  void _hideCustomOverlay() {
    setState(() {
      _showOverlay = false;
      _overlayWidget = const SizedBox();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(currentIndex: 2),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header Section
                  SizedBox(
                    width: double.infinity,
                    height: 240,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 175,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFF111827), width: 1),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            child: Image.asset(
                              Assets.images.img6.path,
                              width: double.infinity,
                              height: 175,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 90,
                          child: ClipPath(
                            clipper: HexagonClipper(),
                            child: Container(
                              width: 130,
                              height: 160,
                              child: Image.asset(
                                Assets.images.img2.path,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Menu Options
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      buildProfileOption(
                        icon: Icons.person,
                        text: "My Profile",
                        onTap: () {
                          Get.to(() => const MyProfileScreen());
                        },
                      ),
                      const SizedBox(height: 12),
                      buildProfileOption(
                        icon: Icons.settings,
                        text: "Account Setting",
                        onTap: () {
                          Get.to(() => const AccountSettingScreen());
                        },
                      ),
                      const SizedBox(height: 24),
                      const Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Text(
                          'More',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 28 / 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      buildProfileOption(
                        icon: Icons.article,
                        text: "Terms & Condition",
                        onTap: () {
                          Get.to(() => const TermsAndConditionsScreen());
                        },
                      ),
                      const SizedBox(height: 12),
                      buildProfileOption(
                        icon: Icons.note,
                        text: "Privacy policy",
                        onTap: () {
                          Get.to(() => const PrivacyPolicyScreen());
                        },
                      ),
                      const SizedBox(height: 12),
                      buildProfileOption(
                        icon: Icons.help_outline,
                        text: "Help/Support",
                        onTap: () {
                          Get.to(() => const HelpSupportScreen());
                        },
                      ),
                      const SizedBox(height: 12),
                      buildProfileOption(
                        icon: Icons.logout,
                        text: "Log Out",
                        onTap: () {
                          _showCustomOverlay(
                            WarningToster(
                              message: "Are you sure you want to log out of your account?",
                              onCancel: _hideCustomOverlay,
                              onConfirm: () {
                                _hideCustomOverlay();
                                Future.delayed(const Duration(milliseconds: 200), () {
                                  _showCustomOverlay(
                                    SuccessToster(
                                      message: "You have been logged out successfully.",
                                      onOkTap: _hideCustomOverlay,
                                    ),
                                  );
                                });
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Overlay Layer
          if (_showOverlay)
            Container(
              color: Colors.black.withOpacity(0.4),
              child: Center(child: _overlayWidget),
            ),
        ],
      ),
    );
  }

  Widget buildProfileOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        padding: const EdgeInsets.fromLTRB(6, 6, 4, 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1A000000),
              offset: const Offset(1, 1),
              blurRadius: 24,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(left: 6, right: 12),
                  child: Icon(
                    icon,
                    size: 20,
                    color: const Color(0xFF111827),
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 28 / 14,
                    color: Color(0xFF111827),
                  ),
                ),
              ],
            ),
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF84C000),
                borderRadius: BorderRadius.circular(2000),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_nav.dart';
import '../../widgets/custom_userflow_topbar.dart';
import '../../widgets/WarningToster.dart';
import '../../widgets/SuccessToster.dart';
import '../../../gen/assets.gen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  const CustomUserFlowTopBar(title: 'Edit Profile', text: ''),
                  const SizedBox(height: 32),
                  Center(
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            Assets.images.img.path,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 117,
                          left: 100,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7FFEF),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x1A000000),
                                  blurRadius: 24,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                Assets.images.img5.path,
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomInput(
                    controller: firstNameController,
                    labelText: "First Name",
                    hintText: "e.g. Kristin",
                  ),
                  const SizedBox(height: 16),
                  CustomInput(
                    controller: lastNameController,
                    labelText: "Last Name",
                    hintText: "e.g. Cooper",
                  ),
                  const SizedBox(height: 16),
                  CustomInput(
                    controller: emailController,
                    labelText: "Email Address",
                    hintText: "e.g. kristin.cooper@example.com",
                  ),
                  const SizedBox(height: 16),
                  CustomInput(
                    controller: addressController,
                    labelText: "Address",
                    hintText: "e.g. 1234 Elm Street, Springfield, IL",
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: "Update",
                    onPressed: () {
                      _showCustomOverlay(
                        WarningToster(
                          message: "Are you sure you want to update your profile information?",
                          onCancel: _hideCustomOverlay,
                          onConfirm: () {
                            _hideCustomOverlay();
                            Future.delayed(const Duration(milliseconds: 200), () {
                              _showCustomOverlay(
                                SuccessToster(
                                  message: "Your profile has been updated successfully.",
                                  onOkTap: _hideCustomOverlay,
                                ),
                              );
                            });
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          if (_showOverlay)
            Container(
              color: Colors.black.withOpacity(0.4),
              child: Center(child: _overlayWidget),
            ),
        ],
      ),
    );
  }
}

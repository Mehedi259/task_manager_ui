import 'package:flutter/material.dart';
import '../../widgets/custom_userflow_topbar.dart';
import '../../widgets/custom_input_password.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/WarningToster.dart';
import '../../widgets/SuccessToster.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscureOld = true;
  bool obscureNew = true;
  bool obscureConfirm = true;

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
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomUserFlowTopBar(
                    title: "Change Password",
                    text: "Change Password",
                  ),
                  const SizedBox(height: 24),

                  // Old Password
                  CustomInputPassword(
                    controller: oldPasswordController,
                    hintText: "Type Password",
                    obscureText: obscureOld,
                    onToggle: () {
                      setState(() {
                        obscureOld = !obscureOld;
                      });
                    },
                    labelText: "Current Password",
                  ),
                  const SizedBox(height: 16),

                  // New Password
                  CustomInputPassword(
                    controller: newPasswordController,
                    hintText: "New Password",
                    obscureText: obscureNew,
                    onToggle: () {
                      setState(() {
                        obscureNew = !obscureNew;
                      });
                    },
                    labelText: "New Password",
                  ),
                  const SizedBox(height: 16),

                  // Confirm New Password
                  CustomInputPassword(
                    controller: confirmPasswordController,
                    hintText: "New Confirm Password",
                    obscureText: obscureConfirm,
                    onToggle: () {
                      setState(() {
                        obscureConfirm = !obscureConfirm;
                      });
                    },
                    labelText: "Confirm New Password",
                  ),
                  const SizedBox(height: 32),

                  // Update Button
                  CustomButton(
                    text: "Update",
                    onPressed: () {
                      _showCustomOverlay(
                        WarningToster(
                          message: "Are you sure you want to change your password?",
                          onCancel: _hideCustomOverlay,
                          onConfirm: () {
                            _hideCustomOverlay();
                            Future.delayed(const Duration(milliseconds: 200), () {
                              _showCustomOverlay(
                                SuccessToster(
                                  message: "Your password has been changed successfully..",
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

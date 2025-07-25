import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_ui/view/screens/profile/change_password_screen.dart';
import '../../widgets/custom_nav.dart';
import '../../widgets/custom_userflow_topbar.dart';
import '../../widgets/custom_user_action_button.dart';
import '../../widgets/SuccessToster.dart';
import '../../widgets/WarningToster.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  void _showWarningToster(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: WarningToster(
            message:
            "Are you sure you want to permanently delete your account? This action cannot be undone.",
            onCancel: () {
              Navigator.of(context).pop(); // close warning
            },
            onConfirm: () {
              Navigator.of(context).pop(); // close warning
              _showSuccessToster(context);
            },
          ),
        );
      },
    );
  }

  void _showSuccessToster(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: SuccessToster(
            message: "Your account has been deleted successfully.",
            onOkTap: () {
              Navigator.of(context).pop(); // close success toaster
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(currentIndex: 2),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomUserFlowTopBar(title: "Account Setting", text: ''),
            const SizedBox(height: 24),

            // Change Password
            CustomUserActionButton(
              icon: Icons.lock,
              label: "Change Password",
              onTap: () {
                Get.to(() => const ChangePasswordScreen());
              },
            ),
            const SizedBox(height: 16),

            // Delete Account
            CustomUserActionButton(
              icon: Icons.delete_forever,
              label: "Delete Account",
              onTap: () {
                _showWarningToster(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

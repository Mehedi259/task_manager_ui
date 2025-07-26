import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_ui/view/screens/profile/change_password_screen.dart';
import '../../../gen/assets.gen.dart';
import '../../widgets/SuccessToster.dart';
import '../../widgets/WarningToster.dart';
import '../../widgets/custom_nav.dart';
import '../../widgets/custom_userflow_topbar.dart';


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
              Navigator.of(context).pop();
            },
            onConfirm: () {
              Navigator.of(context).pop();
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
              Navigator.of(context).pop();
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


            // Change Password (lock.png)
            _settingButton(
              iconPath: Assets.icons.lock.path,
              label: "Change Password",
              onTap: () {
                Get.to(() => const ChangePasswordScreen());
              },
            ),
            const SizedBox(height: 16),

            // Delete Account (delete_account.png)
            _settingButton(
              iconPath: Assets.icons.deleteAccount.path,
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

  Widget _settingButton({
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52,
        margin: const EdgeInsets.symmetric(horizontal: 16),
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
            // Icon with 40x40 size
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset(
                iconPath,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
            const Text("|", style: TextStyle(color: Color(0xFF84C000), fontSize: 18)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.2,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

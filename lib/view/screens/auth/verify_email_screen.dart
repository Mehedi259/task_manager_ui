import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_ui/view/screens/auth/verify_otp_screen.dart';
import '../../widgets/custom_auth_screen_header.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_button.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSend() {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your email address',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }


    Get.snackbar(
      'Success',
      'Verification code sent to $email',
      snackPosition: SnackPosition.BOTTOM,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAuthScreenHeader(
                title: 'Verify Your Email',
                subtitle:
                "We'll send a verification code to this email to confirm your account.",
              ),

              const SizedBox(height: 8), // 8px gap

              CustomInput(
                controller: _emailController,
                labelText: 'Email Address',
                hintText: 'Bdcalling@example.com',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 6), // 6px gap

              CustomButton(
                text: 'Send',
                onPressed: () {
                  final email = _emailController.text.trim();
                  if (email.isEmpty) {
                    Get.snackbar('Error', 'Please enter your email address', snackPosition: SnackPosition.BOTTOM);
                    return;
                  }

                  Get.to(() => VerifyOtpScreen(email: email));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

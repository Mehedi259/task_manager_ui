import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_input_password.dart';
import '../../widgets/custom_auth_screen_header.dart';
import '../../widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool agreeTerms = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (!agreeTerms) {
      Get.snackbar(
        'Error',
        'Please agree to Terms & Conditions.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    // TODO: এখানে ফর্ম ভ্যালিডেশন বা অন্য লজিক দিতে পারো

    // Navigate to verify email screen
    Get.toNamed('/verify-email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAuthScreenHeader(
              title: "Create Your Account",
              subtitle:
              "Join Task Manager today — organize better, work smarter, and stay in control of your day.",
            ),
            const SizedBox(height: 24),

            CustomInput(
              controller: firstNameController,
              hintText: "e.g. Mehedi Hasan",
              labelText: 'First Name',
            ),
            const SizedBox(height: 12),
            CustomInput(
              controller: lastNameController,
              hintText: "e.g. Mridul",
              labelText: 'Last Name',
            ),
            const SizedBox(height: 12),
            CustomInput(
              controller: emailController,
              hintText: "Bdcalling@example.com",
              keyboardType: TextInputType.emailAddress,
              labelText: 'Email Address',
            ),
            const SizedBox(height: 12),
            CustomInput(
              controller: addressController,
              hintText: "e.g. 1234 Elm Street, Springfield, IL",
              labelText: 'Address',
            ),
            const SizedBox(height: 12),

            CustomInputPassword(
              controller: passwordController,
              hintText: "Enter Password",
              obscureText: obscurePassword,
              onToggle: () => setState(() => obscurePassword = !obscurePassword),
              labelText: 'Password',
            ),
            const SizedBox(height: 12),
            CustomInputPassword(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: obscureConfirmPassword,
              onToggle: () => setState(() => obscureConfirmPassword = !obscureConfirmPassword),
              labelText: 'Confirm Password',
            ),

            const SizedBox(height: 12),
            Row(
              children: [
                Checkbox(
                  value: agreeTerms,
                  onChanged: (val) => setState(() => agreeTerms = val ?? false),
                ),
                const Expanded(
                  child: Text(
                    "I agree to the Terms & Conditions and Privacy Policy.",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Color(0xFF344054),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    color: Color(0xFF64748B),
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'OR',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFF0A0E23),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color(0xFF64748B),
                    thickness: 1.5,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFF344054),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF84C000),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),
            CustomButton(
              text: "Continue",
              onPressed: _handleContinue,
            ),
          ],
        ),
      ),
    );
  }
}

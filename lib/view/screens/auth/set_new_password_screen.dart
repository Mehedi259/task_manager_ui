import 'package:flutter/material.dart';
import '../../widgets/custom_auth_screen_header.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input_password.dart';
import '../../widgets/WarningToster.dart';
import '../../widgets/SuccessToster.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _showWarningToster() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: WarningToster(
          message: "Are you sure to Update Password?",
          onCancel: () {
            Navigator.pop(context); // close warning
          },
          onConfirm: () {
            Navigator.pop(context); // close warning
            _showSuccessToster();
          },
        ),
      ),
    );
  }

  void _showSuccessToster() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: SuccessToster(
          message: "Your password has been updated successfully.",
          onOkTap: () {
            Navigator.pop(context); // close success
            // Optionally: Navigate to login/home
          },
        ),
      ),
    );
  }

  void _handleConfirmPassword() {
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    _showWarningToster(); // Show custom warning toaster
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
                title: 'Set Your New Password',
                subtitle: 'Create a secure password to protect your account and get started seamlessly!',
              ),
              const SizedBox(height: 8),
              CustomInputPassword(
                controller: _passwordController,
                labelText: 'New Password',
                hintText: '••••••••',
                obscureText: _obscurePassword,
                onToggle: _togglePasswordVisibility,
              ),
              const SizedBox(height: 6),
              CustomInputPassword(
                controller: _confirmPasswordController,
                labelText: 'Confirm Password',
                hintText: '••••••••',
                obscureText: _obscureConfirmPassword,
                onToggle: _toggleConfirmPasswordVisibility,
              ),
              const SizedBox(height: 6),
              CustomButton(
                text: 'Confirm',
                onPressed: _handleConfirmPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../widgets/custom_auth_screen_header.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_input_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Toggles password visibility
  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  /// Validates input, checks internet, and handles login logic
  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    // Step 1: Check Internet Connection
    var connectivityResult = await Connectivity().checkConnectivity();
    bool hasConnection = connectivityResult != ConnectivityResult.none;

    if (!hasConnection) {
      _showSnackbar('No Internet', 'Please check your internet connection');
      return;
    }

    // Step 2: Check fields
    if (email.isEmpty || password.isEmpty) {
      _showSnackbar('Error', 'Please enter both email and password');
      return;
    }

    // Step 3: Perform login (Demo)
   // _showSnackbar('Success', 'Login successful (demo)');

    // Step 4: Navigate to My Task Screen
    await Future.delayed(const Duration(milliseconds: 500));
    Get.offAllNamed('/my-tasks');
  }

  /// Displays snackbar message
  void _showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  /// Navigates to sign up screen
  void _navigateToSignUp() {
    Get.toNamed('/signup');
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
                title: 'Welcome Back!',
                subtitle: 'Stay productive and take control of your tasks.',
              ),
              const SizedBox(height: 40),

              // Email input
              CustomInput(
                controller: _emailController,
                labelText: 'Email Address',
                hintText: 'Bdcalling@example.com',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 24),

              // Password input
              CustomInputPassword(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                obscureText: _obscurePassword,
                onToggle: _togglePasswordVisibility,
              ),

              const SizedBox(height: 12),

              // Remember Me
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Color(0xFF344054),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // OR Divider
              _buildOrDivider(),

              const SizedBox(height: 32),

              // Sign up text
              _buildSignUpText(),

              const SizedBox(height: 32),

              // Login Button
              CustomButton(
                text: 'Log In',
                onPressed: _handleLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the OR divider with lines
  Widget _buildOrDivider() {
    return Row(
      children: const [
        Expanded(
          child: Divider(
            color: Color(0xFF64748B),
            thickness: 1.5,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
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
    );
  }

  /// Builds the sign up prompt with clickable text
  Widget _buildSignUpText() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Color(0xFF344054),
          ),
          children: [
            const TextSpan(text: "Don’t have an account? "),
            TextSpan(
              text: "Sign Up",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF84C000),
              ),
              recognizer: TapGestureRecognizer()..onTap = _navigateToSignUp,
            ),
          ],
        ),
      ),
    );
  }
}

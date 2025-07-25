import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_auth_screen_header.dart';
import '../../widgets/custom_button.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  const VerifyOtpScreen({super.key, required this.email});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final List<String> _otpDigits = List.filled(6, '');
  final TextEditingController _hiddenController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _hiddenController.addListener(_onOtpChanged);
  }

  @override
  void dispose() {
    _hiddenController.removeListener(_onOtpChanged);
    _hiddenController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onOtpChanged() {
    final text = _hiddenController.text;
    if (text.length <= 6) {
      for (int i = 0; i < 6; i++) {
        _otpDigits[i] = i < text.length ? text[i] : '';
      }
      setState(() {});
    }
  }

  void _handleConfirm() {
    // কোনো চেক বা ভেরিফিকেশন ছাড়াই সরাসরি নেভিগেটেশন
    Get.toNamed('/set-new-password');
  }

  Widget _buildOtpBox(int index) {
    const String placeholder = '•';

    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: const Color(0xFFF7FFEF),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFEAECF0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 24,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        _otpDigits[index].isEmpty ? placeholder : _otpDigits[index],
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: _otpDigits[index].isEmpty ? Colors.grey : Colors.black,
          letterSpacing: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAuthScreenHeader(
                  title: '6-digit code',
                  subtitle: "Please enter the code we've sent to ${widget.email}",
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, _buildOtpBox),
                ),
                const SizedBox(height: 12),
                Opacity(
                  opacity: 0,
                  child: TextField(
                    autofocus: true,
                    focusNode: _focusNode,
                    controller: _hiddenController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: const InputDecoration(counterText: ''),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Confirm',
                  onPressed: _handleConfirm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

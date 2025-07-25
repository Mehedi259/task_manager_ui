import 'package:flutter/material.dart';
import '../../widgets/custom_nav.dart';
import '../../widgets/custom_userflow_topbar.dart';
import '../../widgets/custom_description.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/SuccessToster.dart';
import '../../widgets/WarningToster.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _titleController = TextEditingController();

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
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(currentIndex: 0),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomUserFlowTopBar(
                    title: 'Edit Task',
                    text: '',
                  ),
                  const SizedBox(height: 32),

                  // Task Title Input Field
                  CustomInput(
                    controller: _titleController,
                    hintText: 'e.g. Design Landing Page Header',
                    labelText: 'Task Title',
                  ),

                  const SizedBox(height: 14),

                  // Description Field
                  const CustomDescriptionField(),

                  const SizedBox(height: 20),

                  // Update Task Button
                  CustomButton(
                    text: 'Update Task',
                    onPressed: () {
                      final title = _titleController.text.trim();
                      if (title.isEmpty) {
                        // Just return silently — no snackbar per your request
                        return;
                      }

                      _showCustomOverlay(
                        WarningToster(
                          message: "Are you sure you want to update this task?",
                          onCancel: () => _hideCustomOverlay(),
                          onConfirm: () {
                            _hideCustomOverlay();
                            Future.delayed(const Duration(milliseconds: 200), () {
                              _showCustomOverlay(
                                SuccessToster(
                                  message: "The task has been updated successfully.",
                                  onOkTap: () => _hideCustomOverlay(),
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

          // Overlay layer for toaster
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

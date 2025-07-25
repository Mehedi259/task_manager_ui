import 'package:flutter/material.dart';
import '../../widgets/custom_nav.dart';
import '../../widgets/custom_userflow_topbar.dart';
import '../../widgets/custom_description.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/SuccessToster.dart';
import '../../widgets/WarningToster.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
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
      bottomNavigationBar: const CustomNavBar(currentIndex: 1),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomUserFlowTopBar(title: 'Add Task', text: ''),
                  const SizedBox(height: 32),

                  CustomInput(
                    controller: _titleController,
                    hintText: 'e.g. Design Landing Page Header',
                    labelText: 'Task Title',
                  ),

                  const SizedBox(height: 14),

                  const CustomDescriptionField(),

                  const SizedBox(height: 20),

                  CustomButton(
                    text: 'Save Task',
                    onPressed: () {
                      final title = _titleController.text.trim();
                      if (title.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a task title')),
                        );
                        return;
                      }

                      _showCustomOverlay(
                        WarningToster(
                          message: "Are you sure you want to Add this task?",
                          onCancel: () => _hideCustomOverlay(),
                          onConfirm: () {
                            _hideCustomOverlay();
                            Future.delayed(const Duration(milliseconds: 200), () {
                              _showCustomOverlay(
                                SuccessToster(
                                  message: "Your task has been added successfully.",
                                  onOkTap: () {
                                    _hideCustomOverlay();
                                    _titleController.clear(); // Optional
                                  },
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

          // Custom Toaster Overlay
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

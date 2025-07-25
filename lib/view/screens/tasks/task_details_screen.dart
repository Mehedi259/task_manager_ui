import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../../widgets/custom_userflow_topbar.dart';
import '../../widgets/SuccessToster.dart';
import '../../widgets/WarningToster.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
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
    final args = Get.arguments ?? {};
    final String title = args['title'] ?? '';
    final String description = args['description'] ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                const CustomUserFlowTopBar(title: 'Task Details', text: ''),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Task Title
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Assets.icons.icon1.image(width: 24, height: 24),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Task Title',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF242424),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          title,
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF6B7280),
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 14),
                              const Divider(
                                color: Color(0xFF84C000),
                                thickness: 0.5,
                                height: 0.5,
                              ),
                              const SizedBox(height: 14),

                              // Task Description
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Assets.icons.icon2.image(width: 24, height: 24),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Task Description',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF242424),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          description,
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF6B7280),
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 14),
                              const Divider(
                                color: Color(0xFF84C000),
                                thickness: 0.5,
                                height: 0.5,
                              ),
                              const SizedBox(height: 14),

                              // Buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Delete Task Button
                                  InkWell(
                                    onTap: () {
                                      _showCustomOverlay(
                                        WarningToster(
                                          message: "Are you sure you want to delete this task?",
                                          onCancel: () => _hideCustomOverlay(),
                                          onConfirm: () {
                                            _hideCustomOverlay();
                                            Future.delayed(const Duration(milliseconds: 200), () {
                                              _showCustomOverlay(
                                                SuccessToster(
                                                  message: "The task has been permanently removed.",
                                                  onOkTap: () => _hideCustomOverlay(),
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFEF2F2),
                                        border: Border.all(color: const Color(0xFFEF4444)),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.delete, size: 14.4, color: Color(0xFFEF4444)),
                                            SizedBox(width: 4),
                                            Text(
                                              'Delete Task',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF111827),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  // Edit Task Button
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        '/edit-task',
                                        arguments: {
                                          'title': title,
                                          'description': description,
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF7FFEF),
                                        border: Border.all(color: const Color(0xFF84C000)),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.edit, size: 16, color: Color(0xFF84C000)),
                                            SizedBox(width: 4),
                                            Text(
                                              'Edit Task',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF111827),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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

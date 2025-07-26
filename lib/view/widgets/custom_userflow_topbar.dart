import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';

class CustomUserFlowTopBar extends StatelessWidget {
  final String title;

  const CustomUserFlowTopBar({
    super.key,
    required this.title, required String text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  Assets.icons.back.path,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(width: 40),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';

class CustomTaskCard extends StatelessWidget {
  final String title;
  final String description;
  final AssetGenImage image;
  final AssetGenImage icon;

  const CustomTaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/task-details',
          arguments: {
            'title': title,
            'description': description,
          },
        );
      },
      child: Container(
        width: 358,
        height: 141,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image.provider(),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 24,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              icon.path,
              width: 26,
              height: 26,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 318,
              height: 21,
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.0,
                  color: Color(0xFF111827),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 318,
              height: 28,
              child: Text(
                description,
                style: const TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                  color: Color(0xFF6B7280),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

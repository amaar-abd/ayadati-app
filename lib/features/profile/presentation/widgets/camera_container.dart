import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CameraContainer extends StatelessWidget {
  const CameraContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 4,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.accentGold,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.camera_alt, color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }
}

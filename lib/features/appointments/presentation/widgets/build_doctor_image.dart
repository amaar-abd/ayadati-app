import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildDoctorImage extends StatelessWidget {
  const BuildDoctorImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.accentGold.withAlpha(100),
          width: 1,
        ),
      ),
      child: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(imageUrl),
        backgroundColor: AppColors.background,
      ),
    );
  }
}

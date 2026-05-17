
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.20,
      width: width - 25,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 4,
            offset: Offset(2, 7),
          ),
        ],
        color: AppColors.background,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.accentGold.withAlpha(200),
              width: 5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: AppColors.textSecondary
                  .withAlpha(40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Icon(
                  Icons.person,
                  color: AppColors.accentGold,
                  size: 75,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

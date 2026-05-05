import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class BuildHeaderSignin extends StatelessWidget {
  const BuildHeaderSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primaryBlue, Color(0xFF283593)],
            ),
            color: AppColors.primaryBlue,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withAlpha(10),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  Assets.assetsImagesLogoApp,
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'عيادتي',
              style: TextTheme.of(context).headlineMedium?.copyWith(
                color: AppColors.background,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'سعداء برؤيتك مرة أخرى',
              style: TextTheme.of(context).bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

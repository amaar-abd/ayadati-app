import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSuccessInfoCart extends StatelessWidget {
  const CustomSuccessInfoCart({
    super.key,
    required this.title,
    required this.subTitle,
    required this.descIcon,
    required this.icon,
  });

  final String title;
  final String subTitle;
  final String descIcon;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: AppColors.background,
        border: Border.all(color: AppColors.textSecondary)
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon,
                SizedBox(width: 6),
                Text(
                  descIcon,
                  style: theme.bodyMedium?.copyWith(color: AppColors.accentGold,fontWeight: FontWeight.bold),
                ),
              ],
            ),const SizedBox(height: 8,),
            Text(
              title,
              style: theme.bodyLarge?.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),const SizedBox(height: 8,),
            Text(
              subTitle.split('\n').join(' '),
              style: theme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

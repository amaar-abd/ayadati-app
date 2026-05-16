import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.widget,
  });
  final String title;
  final String subTitle;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              blurRadius: 10,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
          title: Text(
            title,
            style: TextTheme.of(context).bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              subTitle,
              style: TextTheme.of(context).bodyMedium?.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.accentGold.withAlpha(80),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: const IconThemeData(
                    color: AppColors.primaryBlue,
                    size: 22,
                  ),
                ),
                child: widget,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

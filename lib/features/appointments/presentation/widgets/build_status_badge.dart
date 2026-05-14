import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildStatusBadge extends StatelessWidget {
  const BuildStatusBadge({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    Color color = status == 'مؤكد' ? AppColors.success : AppColors.warning;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(40),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextTheme.of(
          context,
        ).bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}

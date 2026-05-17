import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildMenuItem extends StatelessWidget {
  const BuildMenuItem({
    super.key,
    required this.context,
    required this.icon,
    required this.title,
    required this.onTap,
     this.color,
     this.fontWeight
  });
  final BuildContext context;
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: color??AppColors.primaryBlue, size: 20),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextTheme.of(context).bodyMedium?.copyWith(
                color: color?? AppColors.primaryBlue,
                fontWeight: fontWeight??FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

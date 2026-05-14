import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildInfoRow extends StatelessWidget {
  const BuildInfoRow({
    super.key,
    required this.icon,
    required this.text,
    this.isBold = false,
  });
  final IconData icon;
  final String text;
  final bool isBold;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextTheme.of(context).bodyLarge?.copyWith(
              color: isBold ? AppColors.textPrimary : AppColors.textSecondary,
              fontSize: 12,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

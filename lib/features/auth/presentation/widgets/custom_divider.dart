import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider()),
        const SizedBox(width: 8),
        Text(
          'أو',
          style: TextTheme.of(context).displayMedium?.copyWith(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Divider()),
      ],
    );
  }
}

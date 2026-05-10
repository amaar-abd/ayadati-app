import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AvailabilitySlotRow extends StatelessWidget {
  const AvailabilitySlotRow({
    super.key,
    required this.periodName,
    required this.icon,
     this.mainAxisAlignment,
  });
  final String periodName;
  final Widget icon;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.start,
      children: [
        icon,
        const SizedBox(width: 5),
        Text(periodName,
          style: TextTheme.of(context).bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
          ),
        ),
      ],
    );
  }
}

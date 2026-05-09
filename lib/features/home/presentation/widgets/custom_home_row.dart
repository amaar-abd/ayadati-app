import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomHomeRow extends StatelessWidget {
  const CustomHomeRow({super.key, required this.isExpanded, this.onPressed});
  final bool isExpanded;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'التخصصات الطبية',
          style: TextTheme.of(
            context,
          ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isExpanded ? 'عرض أقل' : 'عرض الكل',
                style: TextTheme.of(context).bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentGold,
                ),
              ),
              SizedBox(width: 5),
              FaIcon(
                isExpanded
                    ? FontAwesomeIcons.angleUp
                    : FontAwesomeIcons.angleDown,
                color: AppColors.accentGold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class UserQuestionRow extends StatelessWidget {
  const UserQuestionRow({
    super.key,
    this.ask,
     this.answer,
    this.mainAxisAlignment,
    this.onTap,
  });
  final String? ask;
  final String? answer;
  final void Function()? onTap;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              style: TextTheme.of(context).bodyMedium?.copyWith(color: AppColors.textSecondary),
              children: [
                TextSpan(text: ask),
                TextSpan(
                  text: answer,
                  style: TextTheme.of(context).bodyMedium?.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

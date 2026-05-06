import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AccountsButton extends StatelessWidget {
  const AccountsButton({
    super.key,
    required this.widget,
    required this.text,
    required this.onTap,
  });
  final Widget widget;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(width: 0.5, color: AppColors.accentGold),
          ),
          child: SizedBox(
            height: 50,
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25, width: 25, child: widget),
                SizedBox(width: 6),
                Text(
                  text,
                  style: TextTheme.of(context).bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

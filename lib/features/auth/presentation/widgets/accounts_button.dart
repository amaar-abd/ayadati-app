import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AccountsButton extends StatelessWidget {
  const AccountsButton({super.key, required this.widget, required this.text});
  final Widget widget;
  final String text;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.grey.shade400, spreadRadius: 1)],
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
    );
  }
}

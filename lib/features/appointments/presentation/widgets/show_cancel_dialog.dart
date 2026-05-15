import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';


void showCancelDialog(BuildContext context , void Function()? onPressed) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      actionsPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'تأكيد الإلغاء',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.info_outline, color: AppColors.error, size: 22),
        ],
      ),

      content: Text(
        'هل أنت متأكد من رغبتك في إلغاء هذا الموعد؟ لا يمكن التراجع عن هذا الإجراء لاحقاً.',
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.textSecondary,
          height: 1.6,
        ),
      ),

      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'تراجع',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  foregroundColor: AppColors.textOnPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: onPressed,
                child: const Text(
                  'نعم، إلغاء الموعد',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

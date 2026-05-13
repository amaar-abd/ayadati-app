import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/user_booking/presentation/widgets/instruction_Item_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstructionsCard extends StatelessWidget {
  const InstructionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withAlpha(10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const FaIcon(
                FontAwesomeIcons.circleInfo,
                color: AppColors.primaryBlue,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'تعليمات هامة',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          InstructionItemRow(
            text:
                'يرجى الحضور قبل الموعد بـ 15 دقيقة لإنهاء الإجراءات الإدارية.',
          ),
          InstructionItemRow(
            text: 'تأكد من إحضار الهوية الوطنية وبطاقة التأمين الطبي (إن وجد).',
          ),
          InstructionItemRow(
            text:
                'يمكنك إلغاء أو إعادة جدولة الموعد قبل 24 ساعة من تاريخ الزيارة.',
          ),
        ],
      ),
    );
  }
}

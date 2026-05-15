import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyAppointmentsView extends StatelessWidget {
  const EmptyAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: 175,
            color: AppColors.accentGold.withAlpha(110),
          ),
          const SizedBox(height: 20),
          Text(
            'لا توجد مواعيد محجوزة حالياً',
            style: TextTheme.of(context).displayMedium?.copyWith(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'لم تقم بحجز أي موعد مع الأطباء بعد.',
            style: TextTheme.of(context).bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

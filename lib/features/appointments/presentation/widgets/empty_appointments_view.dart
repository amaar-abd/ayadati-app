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
            size: 80,
            color: AppColors.accentGold.withAlpha(100),
          ),
          const SizedBox(height: 16),
          Text(
            'لا توجد مواعيد محجوزة حالياً',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'لم تقم بحجز أي موعد مع الأطباء بعد.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
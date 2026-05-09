
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    super.key,
    required this.theme,
    required this.doctor,
  });

  final TextTheme theme;
  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(20),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  color: AppColors.accentGold,
                  width: 5,
                  height: 15,
                ),
                const SizedBox(width: 5),
                Text('السيرة المهنية', style: theme.bodyMedium),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              doctor.desc,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: theme.bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


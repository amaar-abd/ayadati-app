import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key, required this.doctor});
  final DoctorEntity doctor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(20),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: doctor.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              doctor.name,
              style: theme.bodyLarge?.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              doctor.specialty,
              style: theme.bodyLarge?.copyWith(
                color: AppColors.accentGold,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Row(
         mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, color: AppColors.textSecondary),
                Text(
                  ' ${doctor.city}',
                  style: theme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),Spacer(),
                Text(
                  '${(doctor.fees / 1000).toInt()} ألف ل.س  ',
                  style: theme.bodyLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.circle, color: AppColors.success, size: 15),
                    const SizedBox(width: 5),
                    Text(
                      'متاح اليوم',
                      style: theme.bodyMedium?.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 40),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.doctorDetailsView,
                      arguments: doctor,
                    );
                  },
                  child: Text(
                    'حجز موعد',
                    style: theme.bodyLarge?.copyWith(
                      color: AppColors.background,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

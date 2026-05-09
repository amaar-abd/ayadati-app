import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/home/presentation/models/specialty_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpecialtyCard extends StatelessWidget {
  const SpecialtyCard({super.key, required this.model, this.onTap});
  final SpecialtyModel model;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(10),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withAlpha(20),
                  shape: BoxShape.circle,
                ),
                child: FaIcon(
                  model.icon,
                  color: AppColors.primaryBlue,
                  size: 28,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                model.title,
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

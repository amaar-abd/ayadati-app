import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SelectGenderRow extends StatelessWidget {
  const SelectGenderRow({
    super.key,
    required this.selectedGender,
    required this.onTapMale,
    required this.onTapFemale,
  });

  final String? selectedGender;
  final VoidCallback onTapMale;
  final VoidCallback onTapFemale;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTapMale,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: selectedGender == 'ذكر'
                    ? AppColors.primaryBlue.withAlpha(30)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedGender == 'ذكر'
                      ? AppColors.primaryBlue
                      : Colors.grey.shade400,
                  width: selectedGender == 'ذكر' ? 2 : 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.male_rounded,
                    color: selectedGender == 'ذكر'
                        ? AppColors.primaryBlue
                        : Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'ذكر',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedGender == 'ذكر'
                          ? AppColors.primaryBlue
                          : Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: GestureDetector(
            onTap: onTapFemale,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: selectedGender == 'أنثى'
                    ? Colors.pink.withAlpha(30)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedGender == 'أنثى'
                      ? Colors.pink
                      : Colors.grey.shade400,
                  width: selectedGender == 'أنثى' ? 2 : 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.female_rounded,
                    color: selectedGender == 'أنثى' ? Colors.pink : Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'أنثى',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedGender == 'أنثى'
                          ? Colors.pink
                          : Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

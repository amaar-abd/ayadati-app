import 'package:flutter/material.dart';

class RecommendedDoctorsRow extends StatelessWidget {
  const RecommendedDoctorsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'الأطباء الموصى بهم',
          style: TextTheme.of(
            context,
          ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

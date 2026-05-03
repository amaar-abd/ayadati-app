import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.loginView);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(82, 135, 146, 180),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .15,
            height: MediaQuery.of(context).size.height * .04,
            child: Center(
              child: Text(
                'تخطي',
                style: TextTheme.of(
                  context,
                ).bodySmall?.copyWith(color: AppColors.primaryBlue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

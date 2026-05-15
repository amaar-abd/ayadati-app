import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/user_booking/domain/entites/success_entity.dart';
import 'package:ayadati/features/user_booking/presentation/widgets/success_view_body.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key, required this.successEntity});
  final SuccessEntity successEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SuccessViewBody(successEntity: successEntity)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Container(
          color: Colors.transparent,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.mainView,
                (route) => false,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'العودة للرئيسة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.home_outlined,
                  color: AppColors.background,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

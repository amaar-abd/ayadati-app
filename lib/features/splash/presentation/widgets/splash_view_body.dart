import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.assetsImagesSplashDots),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 20),

            Text(
              'عيادتي',
              style: TextTheme.of(context).displayLarge?.copyWith(
                color: AppColors.primaryBlue,
                fontSize: 45,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120),
              child: Divider(color: AppColors.accentGold, thickness: 3),
            ),
          ],
        ),
      ],
    );
  }

  navigateToNextScreen() {
    Future.delayed(Duration(seconds: 2), () async {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboardingView);
    });
  }
}

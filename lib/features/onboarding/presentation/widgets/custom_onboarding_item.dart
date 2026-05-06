import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/services/cache_helper.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/onboarding/presentation/widgets/skip_button.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomOnboardingItem extends StatelessWidget {
  const CustomOnboardingItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.pageController,
    required this.pageIndex,
  });
  final String title;
  final String subTitle;
  final String imagePath;
  final PageController pageController;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imagePath),
        Positioned(top: 5, left: 5, child: SkipButton()),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.45,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [],
              color: AppColors.background,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  Text(title, style: TextTheme.of(context).displayLarge),
                  const SizedBox(height: 20),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextTheme.of(
                      context,
                    ).bodyLarge?.copyWith(color: AppColors.textPrimary),
                  ),
                  Spacer(),
                  DotsIndicator(
                    dotsCount: 2,
                    position: pageIndex.toDouble(),
                    decorator: DotsDecorator(
                      color: pageIndex == 1
                          ? AppColors.primaryBlue
                          : AppColors.textSecondary.withAlpha(120),
                      activeColor: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (pageIndex == 0) {
                          pageController.animateToPage(
                            1,
                            duration: Duration(microseconds: 400),
                            curve: Curves.bounceIn,
                          );
                        } else {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.loginView,
                            (route) => true,
                          );
                          await CacheHelper.setData(
                            key: 'onboarding_done',
                            value: true,
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(pageIndex == 0 ? 'التالي' : 'ابدأ الآن'),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            size: 25,
                            color: AppColors.background,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

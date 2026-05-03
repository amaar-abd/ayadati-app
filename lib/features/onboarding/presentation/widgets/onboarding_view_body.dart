import 'package:ayadati/core/utils/app_images.dart';
import 'package:ayadati/features/onboarding/presentation/widgets/custom_onboarding_item.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(_listenPageIndex);
  }

  void _listenPageIndex() {
    setState(() {
      pageIndex = pageController.page!.round();
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    pageController.removeListener(_listenPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        CustomOnboardingItem(
          pageController: pageController,
          pageIndex: pageIndex,
          imagePath: Assets.assetsImagesOnboarding1,
          title: 'احجز طبيبك من المنزل',
          subTitle:
              ' نخبة من الأطباء و المتخصصين في انتظارك لتقديم رعاية طبية تليق بك',
        ),
        CustomOnboardingItem(
          pageController: pageController,
          pageIndex: pageIndex,
          imagePath: Assets.assetsImagesOnboarding2,
          title: 'سهولة المتابعة و الاستشارة',
          subTitle: 'تابع حالتك الصحية وتواصل مع افضل الأطباء بكل سهولة و آمان',
        ),
      ],
    );
  }
}

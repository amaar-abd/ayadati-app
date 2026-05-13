import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/services/cache_helper.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/core/utils/app_images.dart';
import 'package:ayadati/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, AppRoutes.mainView);
        } else if (state is UnAuthenticated) {
         final bool isDone = (CacheHelper.getData(key: 'onboarding_done') == true);
          if (isDone) {
            Navigator.pushReplacementNamed(context, AppRoutes.loginView);
          }else{
            Navigator.pushReplacementNamed(context, AppRoutes.onboardingView);
          }
        }
      },
      builder: (context, state) {
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
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(Assets.assetsImagesShape,width: double.infinity,)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'عيادتي',
                  style: TextTheme.of(context).displayLarge?.copyWith(
                    color: AppColors.primaryBlue,
                    fontSize: 50,
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
      },
    );
  }
}

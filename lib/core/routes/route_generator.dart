import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:ayadati/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route <dynamic>onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case AppRoutes.splashView:
         return MaterialPageRoute(builder: (context) => const SplashView());
      case AppRoutes.onboardingView:
         return MaterialPageRoute(builder: (context) => const OnboardingView());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('no route defind for ${settings.name}')),
          ),
        );
    }
  }
}
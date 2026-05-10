import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/features/auth/presentation/views/signin_view.dart';
import 'package:ayadati/features/auth/presentation/views/signup_view.dart';
import 'package:ayadati/features/user_booking/presentation/views/booking_view.dart';
import 'package:ayadati/features/user_booking/presentation/views/doctor_details_view.dart';
import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/main_layout/presentation/views/main_view.dart';
import 'package:ayadati/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:ayadati/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case AppRoutes.onboardingView:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (context) => const SigninView());
      case AppRoutes.signupView:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case AppRoutes.mainView:
        return MaterialPageRoute(builder: (context) => const MainView());
      case AppRoutes.doctorDetailsView:
        final doctor = settings.arguments;
        return MaterialPageRoute(
          builder: (context) =>
              DoctorDetailsView(doctor: doctor as DoctorEntity),
        );
      case AppRoutes.bookingView:
        final doctor = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => BookingView(doctor: doctor as DoctorEntity),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('no route defind for ${settings.name}')),
          ),
        );
    }
  }
}

import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:ayadati/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:ayadati/features/splash/presentation/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: BlocProvider(
          create: (context) => AuthCubit(sl.get<AuthRepo>()),
          child: SplashViewBody(),
        )),
    );
  }
}

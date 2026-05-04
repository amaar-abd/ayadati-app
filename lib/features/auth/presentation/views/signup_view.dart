import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:ayadati/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:ayadati/features/auth/presentation/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocProvider(
        create: (context) => SignupCubit(sl.get<AuthRepo>()),
        child: const SignupViewBody(),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
    color: Colors.white,
  ),
        shape: const Border(
          bottom: BorderSide(color: Colors.transparent, width: 0),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

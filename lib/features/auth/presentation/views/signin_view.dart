import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:ayadati/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:ayadati/features/auth/presentation/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(color: Colors.transparent, width: 0),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider(
        create: (context) => SigninCubit(sl.get<AuthRepo>()),
        child: SigninViewBody(),
      ),
    );
  }
}

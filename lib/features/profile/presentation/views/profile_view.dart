import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:ayadati/features/auth/presentation/manager/signout_cubit/signout_cubit.dart';
import 'package:ayadati/features/profile/presentation/widgets/profile_view_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        shape: Border(bottom: BorderSide(color: Colors.transparent, width: 0)),
        backgroundColor: Colors.transparent,
        title: Text(
          'الملف الشخصي',
          style: TextTheme.of(context).displaySmall?.copyWith(
            color: AppColors.background,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: BlocProvider(
        create: (context) =>  SignoutCubit(sl.get<AuthRepo>()),
        child: ProfileViewBody(),
      ),
    );
  }
}

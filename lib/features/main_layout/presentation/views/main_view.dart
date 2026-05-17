import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/features/main_layout/presentation/widgets/main_view_body.dart';
import 'package:ayadati/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<ProfileCubit>()..getUserData(sl.get<FirebaseAuth>().currentUser!.uid),

      child: const MainViewBody(),
    );
  }
}

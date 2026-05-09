import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/features/home/domain/use_cases/get_doctors_use_case.dart';
import 'package:ayadati/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:ayadati/features/home/presentation/widgets/custom_home_appbar.dart';
import 'package:ayadati/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(sl.get<GetDoctorsUseCase>())..fetchDoctors(),
        child: HomeViewBody(),
      ),
      appBar: CustomHomeAppbar(),
    );
  }
}

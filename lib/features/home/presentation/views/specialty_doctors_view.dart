import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/home/domain/use_cases/get_doctors_use_case.dart';
import 'package:ayadati/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:ayadati/features/home/presentation/widgets/specialty_doctors_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialtyDoctorsView extends StatelessWidget {
  const SpecialtyDoctorsView({super.key, required this.specialtyName});
  final String specialtyName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'التخصص : $specialtyName',
          style: TextTheme.of(
            context,
          ).bodyLarge?.copyWith(fontWeight: FontWeight.bold,color: AppColors.primaryBlue),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) =>
            HomeCubit(sl.get<GetDoctorsUseCase>())
              ..fetchDoctors(specialty: specialtyName),
        child: SpecialtyDoctorsViewBody(specialtyName: specialtyName),
      ),
    );
  }
}

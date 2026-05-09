import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:ayadati/features/home/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedDoctorsListview extends StatelessWidget {
  const RecommendedDoctorsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryBlue),
            ),
          );
        } else if (state is HomeFailure) {
          return Center(
            child: Text(
              state.message,
              style: TextTheme.of(
                context,
              ).bodyMedium?.copyWith(color: AppColors.error),
            ),
          );
        } else if (state is HomeSuccess) {
          final doctors = state.doctors;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: doctors.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: RecoomenedDoctorItem(doctor: doctors[index],),
            ),
          );
        } else {
          return Container(height: 100, width: 100, color: AppColors.error);
        }
      },
    );
  }
}

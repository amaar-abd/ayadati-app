import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/search/domain/use_case/search_doctors_use_case.dart';
import 'package:ayadati/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ayadati/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(sl.get<SearchDoctorsUseCase>()),
        child: SearchViewBody(),
      ),
      appBar: AppBar(
        title: Text(
          'البحث عن الاطباء',
          style: TextTheme.of(context).displaySmall?.copyWith(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

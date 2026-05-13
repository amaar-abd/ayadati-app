import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/core/utils/app_images.dart';
import 'package:ayadati/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ayadati/features/search/presentation/widgets/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key, required this.searchController});
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.doctors.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'نتائج البحث',
                        style: TextTheme.of(context).bodyLarge?.copyWith(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentGold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${state.doctors.length} طبيب',
                          style: TextTheme.of(context).bodyMedium?.copyWith(
                            color: AppColors.background,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.doctors.length,
                    
                    itemBuilder: (context, index) {
                      return Padding(
                       padding: const EdgeInsets.only(bottom: 18),
                        child: SearchResultItem(doctor: state.doctors[index]),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 140),
                  Icon(
                    Icons.search_off_rounded,
                    size: 200,
                    color: AppColors.accentGold,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'لا يوجد نتائج تطابق بحثك',
                    style: TextTheme.of(context).displayMedium?.copyWith(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          }
        } else if (state is SearchLaoding) {
          return SizedBox(
            height: 600,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryBlue),
            ),
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          );
        } else if (state is SearchInitial || state is BeforeSearch) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 140),
                Image.asset(Assets.assetsImagesSearshDoctor, height: 250),
                const SizedBox(height: 20),
                Text(
                  'ابحث عن طبيبك المفضل الآن',
                  style: TextTheme.of(context).displayMedium?.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  ' يمكنك البحث حسب الاسم أو التخصص أو المدينة',
                  style: TextTheme.of(context).bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

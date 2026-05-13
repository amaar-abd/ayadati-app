import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ayadati/features/search/presentation/widgets/search_results_list.dart';
import 'package:ayadati/features/search/presentation/widgets/search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(reserSearch);
  }

  void reserSearch() {
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        context.read<SearchCubit>().resetSearch();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _searchController.removeListener(reserSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 15),
          SearchTextFormField(
            suffixIcon: IconButton(
              onPressed: () {
                _searchController.clear();
              },
              icon: Icon(Icons.close, color: AppColors.error),
            ),
            obscureText: false,
            prefixIcon: IconButton(
              onPressed: () {
                context.read<SearchCubit>().fetchSearchResults(
                  _searchController.text,
                );
              },
              icon: Icon(Icons.search, color: AppColors.primaryBlue),
            ),
            hintText: 'ابحث عن طبيب أو تخصص او مشفى',
            controller: _searchController,
          ),
          const SizedBox(height: 10),
          Expanded(child: SearchResultsList(searchController: _searchController)),
        ],
      ),
    );
  }
}

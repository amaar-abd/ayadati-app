import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/search/domain/use_case/search_doctors_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial());
  final SearchDoctorsUseCase searchUseCase;
  Future<void> fetchSearchResults(String query) async {
    emit(SearchLaoding());

    final result = await searchUseCase.call(query);

    result.fold(
      (failure) => emit(SearchFailure(message: failure.message)),
      (doctors) => emit(SearchSuccess(doctors: doctors)),
    );
  }

  void resetSearch() {
  emit(BeforeSearch()); 
}
}

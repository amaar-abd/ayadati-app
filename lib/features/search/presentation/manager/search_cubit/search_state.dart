part of 'search_cubit.dart';

class SearchState {}

final class SearchInitial extends SearchState {}

final class BeforeSearch extends SearchState {}
final class SearchLaoding extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<DoctorEntity> doctors;

  SearchSuccess({required this.doctors});
}

final class SearchFailure extends SearchState {
  final String message;

  SearchFailure({required this.message});
}

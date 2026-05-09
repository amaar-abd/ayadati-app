import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/home/domain/use_cases/get_doctors_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getDoctorsUseCase) : super(HomeInitial());
  final GetDoctorsUseCase getDoctorsUseCase;

  Future<void> fetchDoctors({String? city, String? specialty}) async {
    emit(HomeLoading());
    final results = await getDoctorsUseCase.call(
      city: city,
      specialty: specialty,
    );

    results.fold(
      (failure) => emit(HomeFailure(message: failure.message)),
      (doctors) => emit(HomeSuccess(doctors: doctors)),
    );
  }
}

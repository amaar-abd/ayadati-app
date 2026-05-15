import 'package:ayadati/features/appointments/data/data_source/appointments_remote_data_source.dart';
import 'package:ayadati/features/appointments/data/data_source/appointments_remote_data_source_impl.dart';
import 'package:ayadati/features/appointments/data/repos/appointments_repo_impl.dart';
import 'package:ayadati/features/appointments/domain/repos/appointments_repo.dart';
import 'package:ayadati/features/appointments/domain/use_cases/cancel_appointment_use_case.dart';
import 'package:ayadati/features/appointments/domain/use_cases/get_appointment_user_use_cases.dart';
import 'package:ayadati/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ayadati/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:ayadati/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:ayadati/features/home/data/datasources/firebase_data_source.dart';
import 'package:ayadati/features/home/data/datasources/firebase_data_source_impl.dart';
import 'package:ayadati/features/home/data/repo/doctor_repository_impl.dart';
import 'package:ayadati/features/home/domain/repo/doctor_repository.dart';
import 'package:ayadati/features/home/domain/use_cases/get_doctors_use_case.dart';
import 'package:ayadati/features/search/data/data_source/search_remote_data_source.dart';
import 'package:ayadati/features/search/data/data_source/search_remote_data_source_impl.dart';
import 'package:ayadati/features/search/data/repos/search_repo_impl.dart';
import 'package:ayadati/features/search/domain/repos/search_repo.dart';
import 'package:ayadati/features/search/domain/use_case/search_doctors_use_case.dart';
import 'package:ayadati/features/user_booking/data/data_sources/booking_remote_data_source.dart';
import 'package:ayadati/features/user_booking/data/data_sources/booking_remote_data_source_impl.dart';
import 'package:ayadati/features/user_booking/data/repo/booking_repo_impl.dart';
import 'package:ayadati/features/user_booking/domain/repo/booking_repo.dart';
import 'package:ayadati/features/user_booking/domain/use_cases/add_appointment_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GetIt sl = GetIt.instance;

void getItInit() {
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  sl.registerLazySingleton<FacebookAuth>(() => FacebookAuth.instance);
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firestore: sl.get<FirebaseFirestore>(),
      firebaseAuth: sl.get<FirebaseAuth>(),
      googleSignIn: sl.get<GoogleSignIn>(),
      facebookSignIn: sl.get<FacebookAuth>(),
    ),
  );
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: sl.get<AuthRemoteDataSource>()),
  );

  sl.registerLazySingleton<FirebaseDataSource>(
    () => FirebaseDataSourceImpl(firestore: sl.get<FirebaseFirestore>()),
  );
  sl.registerLazySingleton<DoctorRepository>(
    () =>
        DoctorRepositoryImpl(firebaseDataSource: sl.get<FirebaseDataSource>()),
  );
  sl.registerLazySingleton<GetDoctorsUseCase>(
    () => GetDoctorsUseCase(repository: sl.get<DoctorRepository>()),
  );
  sl.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSourceImpl(firestore: sl.get<FirebaseFirestore>()),
  );
  sl.registerLazySingleton<BookingRepo>(
    () => BookingRepoImpl(
      bookingRemoteDataSource: sl.get<BookingRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<AddAppointmentUseCase>(
    () => AddAppointmentUseCase(bookingRepo: sl.get<BookingRepo>()),
  );

  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(firestore: sl.get<FirebaseFirestore>()),
  );
  sl.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(remoteDataSource: sl.get<SearchRemoteDataSource>()),
  );
  sl.registerLazySingleton<SearchDoctorsUseCase>(
    () => SearchDoctorsUseCase(sl.get<SearchRepo>()),
  );
  //
  sl.registerLazySingleton<AppointmentsRemoteDataSource>(
    () => AppointmentsRemoteDataSourceImpl(
      firestore: sl.get<FirebaseFirestore>(),
    ),
  );
  sl.registerLazySingleton<AppointmentsRepo>(
    () => AppointmentsRepoImpl(
      appointmentsRemoteDataSource: sl.get<AppointmentsRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<GetAppointmentUserUseCases>(
    () => GetAppointmentUserUseCases(
      appointmentsRepo: sl.get<AppointmentsRepo>(),
    ),
  );
  sl.registerLazySingleton<CancelAppointmentUseCase>(
    () => CancelAppointmentUseCase(
      appointmentsRepo: sl.get<AppointmentsRepo>(),
    ),
  );
}

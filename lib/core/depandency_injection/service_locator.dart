import 'package:ayadati/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ayadati/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:ayadati/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void getItInit() {
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<AuthRemoteDataSource>(() =>AuthRemoteDataSourceImpl(firestore: sl.get<FirebaseFirestore>(),firebaseAuth:  sl.get<FirebaseAuth>()));
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(authRemoteDataSource: sl.get<AuthRemoteDataSource>()));
}

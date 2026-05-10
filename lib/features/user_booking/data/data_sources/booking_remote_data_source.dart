abstract class BookingRemoteDataSource {
  Future<void> addAppointment({
   required Map<String, dynamic> data,
    required String path,
  });
}

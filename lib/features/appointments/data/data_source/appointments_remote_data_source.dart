import 'package:ayadati/features/user_booking/data/models/appointment_model.dart';

abstract class AppointmentsRemoteDataSource {
  Future<List<AppointmentModel>> getRemoteAppointments(String userId,String path); 
}
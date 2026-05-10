class AppointmentEntity {
  final String userId;
  final String doctorId;
  final String doctorName;
  final String bookingId;
  final String image;
  final String city;
  final String address;
  final double fees;
  final String specialty;
  final String status;
  final DateTime appointmentDate;

  AppointmentEntity({
    required this.userId,
    required this.doctorId,
    required this.doctorName,
    required this.bookingId,
    required this.image,
    required this.city,
    required this.address,
    required this.fees,
    required this.specialty,
    required this.status,
    required this.appointmentDate,
  });
}

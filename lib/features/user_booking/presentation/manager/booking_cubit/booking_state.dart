part of 'booking_cubit.dart';

 class BookingState {}

final class BookingInitial extends BookingState {}
final class BookingLoading extends BookingState {}
final class BookingSuccess extends BookingState {}
final class BookingFailure extends BookingState {
  final String message;

  BookingFailure({required this.message});
}

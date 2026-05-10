import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/user_booking/presentation/widgets/build_confirmation_card.dart';
import 'package:ayadati/features/user_booking/presentation/widgets/build_time_grid.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class BookingViewBody extends StatefulWidget {
  const BookingViewBody({super.key, required this.doctor});
  final DoctorEntity doctor;
  @override
  State<BookingViewBody> createState() => _BookingViewBodyState();
}

class _BookingViewBodyState extends State<BookingViewBody> {
  DateTime? _selectedDate;
  String? _selectedTime;
  bool _userHasSelectedDate = false;

  final List<String> morningSlots = [
    "09:00 \nصباحاً",
    "09:30 \nصباحاً",
    "10:00 \nصباحاً",
    "10:30 \nصباحاً",
    "11:00 \nصباحاً",
    "11:30 \nصباحاً",
  ];

  final List<String> eveningSlots = [
    "07:00 \nمساءً",
    "07:30 \nمساءً",
    "08:00 \nمساءً",
    "08:30 \nمساءً",
    "09:00 \nمساءً",
    "09:30 \nمساءً",
  ];
  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'اختر الوقت و التاريخ المناسب لك',
              style: theme.displayMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlue,
              ),
            ),
            const SizedBox(height: 20),
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              locale: "ar",
              onDateChange: (date) {
                setState(() {
                  _selectedDate = date;
                  _userHasSelectedDate = true;
                });
              },
              headerProps: const EasyHeaderProps(
                monthPickerType: MonthPickerType.switcher,
                dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
              ),

              dayProps: EasyDayProps(
                dayStructure: DayStructure.dayStrDayNum,
                height: 80,
                width: 70,
                activeDayStyle: _userHasSelectedDate
                    ? const DayStyle(
                        decoration: BoxDecoration(
                          color: Color(0xFF1A237E),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),

                        dayNumStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        dayStrStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    : _buildStandardStyle(),
                todayStyle: _buildStandardStyle(),
                inactiveDayStyle: _buildStandardStyle(),
              ),
            ),
            const SizedBox(height: 25),
            BuildTimeGrid(
              period: 'الفترة الصباحية',
              slots: morningSlots,
              selectedTime: _selectedTime,
              onTimeSelected: (time) {
                setState(() {
                  _selectedTime = time;
                });
              },
            ),
            const SizedBox(height: 18),
            BuildTimeGrid(
              period: 'الفترة المسائية',
              slots: eveningSlots,
              selectedTime: _selectedTime,
              onTimeSelected: (time) {
                setState(() {
                  _selectedTime = time;
                });
              },
            ),
            const SizedBox(height: 40),
            if (_selectedTime != null && _selectedDate != null)
              BuildConfirmationCard(
                selectedDate: _selectedDate!,
                selectedTime: _selectedTime!,
              ),
          ],
        ),
      ),
    );
  }

  DayStyle _buildStandardStyle() {
    return DayStyle(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Colors.grey.withAlpha(20), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      dayNumStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      dayStrStyle: const TextStyle(color: Colors.grey, fontSize: 14),
    );
  }
}

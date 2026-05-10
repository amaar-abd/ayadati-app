import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildConfirmationCard extends StatelessWidget {
  const BuildConfirmationCard({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
  });
  final DateTime selectedDate;
  final String selectedTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A237E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            "الموعد المحدد\n ${DateFormat('EEEE', 'ar').format(selectedDate)} - ${DateFormat('d', 'en').format(selectedDate)} ${DateFormat('MMMM', 'ar').format(selectedDate)} - ${selectedTime.replaceAll('\n', ' ')} ",
            style: const TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B6B23),
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {},
            child: const Text("تأكيد الموعد"),
          ),
        ],
      ),
    );
  }
}

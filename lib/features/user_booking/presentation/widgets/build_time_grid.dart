import 'package:ayadati/features/user_booking/presentation/widgets/availability_slot_row.dart';
import 'package:flutter/material.dart';

class BuildTimeGrid extends StatefulWidget {
  const BuildTimeGrid({
    super.key,
    required this.period,
    required this.slots,
    required this.onTimeSelected,
    this.selectedTime,
  });
  final String period;
  final List<String> slots;
  final ValueChanged<String?> onTimeSelected;
  final String? selectedTime;

  @override
  State<BuildTimeGrid> createState() => _BuildTimeGridState();
}

class _BuildTimeGridState extends State<BuildTimeGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AvailabilitySlotRow(
          periodName: widget.period,
          icon: widget.period == 'الفترة الصباحية'
              ?const Icon(Icons.light_mode_outlined,color:  Color(0xFFC5A059))
              :const Icon(Icons.bedtime_outlined,color:  Color(0xFFC5A059)),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: widget.slots.length,
          itemBuilder: (context, index) {
            bool isSelected = widget.selectedTime == widget.slots[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.onTimeSelected(widget.slots[index]);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF1A237E) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                        color: Colors.blue.withAlpha(30),
                        blurRadius: 5,
                      ),
                  ],
                ),
                child: Center(
                  child: Text(
                    widget.slots[index],
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

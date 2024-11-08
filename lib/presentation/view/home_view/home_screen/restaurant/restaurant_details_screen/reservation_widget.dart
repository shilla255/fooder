
import 'package:flutter/material.dart';

import '../restaurant_model.dart';


class ReservationWidget extends StatefulWidget {
  final Restaurant restaurant;

  const ReservationWidget({super.key, required this.restaurant});

  @override
  _ReservationWidgetState createState() => _ReservationWidgetState();
}

class _ReservationWidgetState extends State<ReservationWidget> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int guests = 2;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Make a Reservation',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: Text(selectedDate == null
                        ? 'Select Date'
                        : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.access_time),
                    label: Text(selectedTime == null
                        ? 'Select Time'
                        : selectedTime!.format(context)),
                    onPressed: () => _selectTime(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Guests: '),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => setState(() {
                    if (guests > 1) guests--;
                  }),
                ),
                Text('$guests'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() {
                    if (guests < 10) guests++;
                  }),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Reserve Now'),
              onPressed: () {
                // Handle reservation logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Reservation request sent!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
}
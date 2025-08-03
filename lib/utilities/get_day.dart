import 'package:flutter/material.dart';

class TimeTracker extends StatelessWidget {
  const TimeTracker({Key? key}) : super(key: key);

  String getWeekName() {
    final now = DateTime.now();
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[now.weekday - 1];
  }

  String getFormattedTime() {
    final now = DateTime.now();
    final hour = now.hour;
    final minute = now.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String getAmPm() {
    final hour = DateTime.now().hour;
    return hour < 12 ? 'AM' : 'PM';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Day: ${getWeekName()}'),
        Text('Time: ${getFormattedTime()} ${getAmPm()}'),
      ],
    );
  }
}

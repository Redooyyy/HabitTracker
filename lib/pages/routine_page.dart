import 'package:flutter/material.dart';
import 'package:hab8/utilities/get_day.dart';
import 'package:hab8/utilities/my_subject.dart';
import 'package:hab8/utilities/routine_item.dart';

class RoutinePage extends StatelessWidget {
  final timeTracker = TimeTracker();
  final Color actived = Colors.green;
  final backgroundActive = Colors.green[200];
  final double spaceBetween = 8;
  RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color deefault = Theme.of(context).colorScheme.secondary;
    final String dayName = timeTracker.getWeekName();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "University Routine",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 10.0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RoutineItem(week: "Day", height: 50, width: 120),
                    SizedBox(width: spaceBetween),

                    RoutineItem(week: "9:00 - 10:20", height: 50, width: 120),
                    RoutineItem(week: "10:25 - 11:45", height: 50, width: 120),
                    RoutineItem(week: "11:50 - 1:10", height: 50, width: 120),
                    RoutineItem(week: "1:30 - 2:50", height: 50, width: 120),
                    RoutineItem(week: "3:00 - 4:20", height: 50, width: 120),
                  ],
                ),
                SizedBox(height: spaceBetween),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: dayName == 'Saturday' ? backgroundActive : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      RoutineItem(
                        week: "Saturday",
                        height: 70,
                        width: 120,
                        color: dayName == 'Saturday' ? actived : deefault,
                      ),
                      SizedBox(width: spaceBetween),

                      MySubject(
                        subject: "HIST 2105\nRoom 314", //1st class
                        color:
                            dayName == 'Saturday' && isInTimeRange(9, 0, 10, 20)
                            ? actived
                            : deefault,
                      ),
                      MySubject(
                        subject: "CSE 2117\nRoom 513", //2nd class
                        color:
                            dayName == 'Saturday' &&
                                isInTimeRange(10, 25, 11, 45)
                            ? actived
                            : deefault,
                      ),
                      MySubject(
                        subject: "EPE 2101\nRoom 423", //3rd class
                        color:
                            dayName == 'Saturday' &&
                                isInTimeRange(11, 50, 13, 10)
                            ? actived
                            : deefault,
                      ),
                      MySubject(
                        subject: "CE 2101\nRoom 418", //4th class
                        w8: 240,
                        color:
                            dayName == 'Saturday' &&
                                isInTimeRange(13, 30, 16, 20)
                            ? actived
                            : deefault,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: dayName == 'Sunday' ? backgroundActive : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      RoutineItem(
                        week: "Sunday",
                        height: 70,
                        width: 120,
                        color: dayName == 'Sunday'
                            ? Colors.green
                            : Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: spaceBetween),

                      MySubject(
                        subject: "CSE 2111\nRoom 132",
                        color:
                            dayName == 'Sunday' && isInTimeRange(9, 0, 10, 20)
                            ? actived
                            : deefault,
                      ),
                      MySubject(
                        subject: "CSE 2112\nRoom 132",
                        w8: 240,
                        color:
                            dayName == 'Sunday' && isInTimeRange(10, 25, 13, 10)
                            ? actived
                            : deefault,
                      ),
                      MySubject(
                        subject: "MATH 2105\nRoom 314",
                        color:
                            dayName == 'Sunday' && isInTimeRange(13, 30, 14, 50)
                            ? actived
                            : deefault,
                      ),
                      MySubject(
                        subject: "CSE 2115\nRoom 226",
                        color:
                            dayName == 'Sunday' && isInTimeRange(15, 0, 16, 20)
                            ? actived
                            : deefault,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: dayName == 'Monday' ? backgroundActive : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      RoutineItem(
                        week: "Monday",
                        height: 70,
                        width: 120,
                        color: dayName == 'Monday' ? actived : deefault,
                      ),
                      SizedBox(width: spaceBetween),

                      MySubject(
                        subject: "HIST 2105\nRoom 314",
                        color:
                            dayName == 'Monday' && isInTimeRange(9, 0, 10, 20)
                            ? actived
                            : deefault,
                      ),
                      MySubject(
                        subject: "CSE 2117\nRoom 213",
                        color:
                            dayName == 'Monday' && isInTimeRange(10, 25, 11, 45)
                            ? actived
                            : deefault,
                      ),
                      MySubject(
                        subject: "EPE 2101\nRoom 213",
                        color:
                            dayName == 'Monday' && isInTimeRange(11, 50, 13, 10)
                            ? actived
                            : deefault,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: dayName == 'Tuesday' ? backgroundActive : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      RoutineItem(
                        week: "Tuesday",
                        height: 70,
                        width: 120,
                        color: dayName == 'Tuesday' ? actived : deefault,
                      ),
                      SizedBox(width: spaceBetween),

                      MySubject(
                        subject: "CSE 2111\nRoom 132",
                        color:
                            dayName == 'Tuesday' && isInTimeRange(9, 0, 10, 20)
                            ? actived
                            : deefault,
                      ),
                      MySubject(
                        subject: "CSE 2116\nRoom 221",
                        w8: 240,
                        color:
                            dayName == 'Tuesday' &&
                                isInTimeRange(10, 25, 13, 10)
                            ? actived
                            : deefault,
                      ),
                      MySubject(
                        subject: "MATH 2105\nRoom 314",
                        color:
                            dayName == 'Tuesday' &&
                                isInTimeRange(13, 30, 14, 50)
                            ? actived
                            : deefault,
                      ),
                      MySubject(
                        subject: "CSE 2115\nRoom 226",
                        color:
                            dayName == 'Tuesday' && isInTimeRange(15, 0, 16, 20)
                            ? actived
                            : deefault,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                Row(
                  children: [
                    RoutineItem(week: "Course Codes", width: 150),
                    RoutineItem(week: "Course Title", width: 300),
                    RoutineItem(week: "Course Teacher", width: 150),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool isInTimeRange(
    int startHour,
    int startMinute,
    int endHour,
    int endMinute,
  ) {
    final now = DateTime.now();

    final start = DateTime(
      now.year,
      now.month,
      now.day,
      startHour,
      startMinute,
    );
    final end = DateTime(now.year, now.month, now.day, endHour, endMinute);

    return now.isAfter(start) && now.isBefore(end);
  }
}

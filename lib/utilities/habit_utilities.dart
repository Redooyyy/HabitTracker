import 'package:hab8/user/habits.dart';

bool isHabitComleted(List<DateTime> completedDays) {
  final today = DateTime.now();

  return completedDays.any(
    (date) =>
        date.year == today.year &&
        date.month == today.month &&
        date.day == today.day,
  );
}

//heatmap dataset

Map<DateTime, int> prepHeatDataset(List<Habits> habits) {
  Map<DateTime, int> dataset = {};

  for (var habit in habits) {
    for (var date in habit.completedDays) {
      final normalDate = DateTime(date.year, date.month, date.day);

      if (dataset.containsKey(normalDate)) {
        dataset[normalDate] = dataset[normalDate]! + 1;
      } else {
        dataset[normalDate] = 1;
      }
    }
  }
  return dataset;
}

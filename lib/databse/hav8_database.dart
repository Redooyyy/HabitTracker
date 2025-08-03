import 'package:flutter/material.dart';
import 'package:hab8/user/app_settings.dart';
import 'package:hab8/user/habits.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Hav8Database extends ChangeNotifier {
  static late Isar isar;

  // S E T U P

  // DATABASE INITIALIZER
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([
      HabitsSchema,
      AppSettingsSchema,
    ], directory: dir.path);
  }

  //SAVE FIRST DATE
  Future<void> saveFirstDate() async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if (existingSettings == null) {
      final settings = AppSettings()..firstLaunch = DateTime.now();
      await isar.writeTxn(() => isar.appSettings.put(settings));
    }
  }

  //GET FIRST DATE
  Future<DateTime?> getDate() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLaunch;
  }
  //C R U D X operations

  // List of habits
  final List<Habits> currentHabits = [];

  //Create new habit
  Future<void> addHabit(String habitName) async {
    // create
    final newHabit = Habits();
    newHabit.name = habitName;

    // save to DB
    await isar.writeTxn(() => isar.habits.put(newHabit));

    //re read from DB
    readHabits();
  }

  //R E A D
  Future<void> readHabits() async {
    //fetching data from database
    List<Habits> fetchData = await isar.habits.where().findAll();

    //give it to current habit list
    currentHabits.clear();
    currentHabits.addAll(fetchData);

    //update UI
    notifyListeners();
  }

  //Update Habit (Check on or off)
  Future<void> updateHabit(int id, bool isComplete) async {
    final habit = await isar.habits.get(id);

    if (habit != null) {
      await isar.writeTxn(() async {
        //if habit completed
        if (isComplete && !habit.completedDays.contains(DateTime.now())) {
          final today = DateTime.now();

          habit.completedDays.add(DateTime(today.year, today.month, today.day));
        } else {
          habit.completedDays.removeWhere(
            (date) =>
                date.year == DateTime.now().year &&
                date.month == DateTime.now().month &&
                date.day == DateTime.now().day,
          );
        }
        await isar.habits.put(habit);
      });
    }
    readHabits();
  }

  //Update Habit (edit habit name)
  Future<void> updateName(int id, String newName) async {
    final habit = await isar.habits.get(id);
    if (habit != null) {
      await isar.writeTxn(() async {
        habit.name = newName;
        isar.habits.put(habit);
      });
    }

    readHabits();
  }

  //Delete Habit
  Future<void> deleteHabit(int id) async {
    await isar.writeTxn(() async {
      await isar.habits.delete(id);
    });
    readHabits();
  }
}

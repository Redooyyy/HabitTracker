import 'package:isar/isar.dart';

part 'habits.g.dart'; //build_runner in console

@collection
class Habits {
  //Habit ID
  Id id = Isar.autoIncrement;

  //Habit Name
  late String name;

  //completed days
  List<DateTime> completedDays = [
    //Day,month,year
  ];
}

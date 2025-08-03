import 'package:flutter/material.dart';
import 'package:hab8/components/list_tile.dart';
import 'package:hab8/components/my_drawer.dart';
import 'package:hab8/components/my_heat_map.dart';
import 'package:hab8/databse/hav8_database.dart';
import 'package:hab8/user/habits.dart';
import 'package:hab8/utilities/habit_utilities.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Hav8Database>(context, listen: false).readHabits();
    super.initState();
  }

  //TEXT CONTROLLER
  final TextEditingController textController = TextEditingController();

  void checkOnOff(bool? value, Habits habit) {
    if (value != null) {
      context.read<Hav8Database>().updateHabit(habit.id, value);
    }
  }

  void createHabit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: "Enter a new habit"),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              String newHabitName = textController.text;
              context.read<Hav8Database>().addHabit(newHabitName);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Save'),
          ),

          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void editHabitBox(Habits habit) {
    textController.text = habit.name;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: textController),
        actions: [
          MaterialButton(
            onPressed: () {
              String newHabitName = textController.text;
              context.read<Hav8Database>().updateName(habit.id, newHabitName);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Save'),
          ),

          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void deleteHabitBox(Habits habit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are you sure you want to delete it?"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              context.read<Hav8Database>().deleteHabit(habit.id);
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Habit Tracker",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 10.0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),

      floatingActionButton: FloatingActionButton(
        tooltip: "Add Task",
        onPressed: () {
          createHabit();
        },
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: const Icon(Icons.add),
      ),

      body: ListView(children: [_buildedHeatMap(), _habitzzz()]),
    );
  }

  Widget _habitzzz() {
    final habitDataBase = context.watch<Hav8Database>();

    List<Habits> currentHabit = habitDataBase.currentHabits;
    return ListView.builder(
      itemCount: currentHabit.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final habit = currentHabit[index];
        bool isCompleted = isHabitComleted(habit.completedDays);
        return MyTile(
          text: habit.name,
          isCompletedd: isCompleted,
          onChanged: (value) => checkOnOff(value, habit),
          editHabit: (context) => {editHabitBox(habit)},
          deleteHbit: (context) => deleteHabitBox(habit),
        );
      },
    );
  }

  Widget _buildedHeatMap() {
    final habitDataBase = context.watch<Hav8Database>();
    List<Habits> currentHabit = habitDataBase.currentHabits;

    return FutureBuilder<DateTime?>(
      future: habitDataBase.getDate(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MyHeatMap(
            startDate: snapshot.data!,
            datasets: prepHeatDataset(currentHabit),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

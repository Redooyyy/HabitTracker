import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyTile extends StatelessWidget {
  final bool isCompletedd;
  final String text;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? editHabit;
  final void Function(BuildContext)? deleteHbit;
  const MyTile({
    super.key,
    required this.text,
    required this.isCompletedd,
    required this.onChanged,
    required this.editHabit,
    required this.deleteHbit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: editHabit,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.edit,
              borderRadius: BorderRadius.circular(10),
            ),
            SlidableAction(
              onPressed: deleteHbit,
              backgroundColor: Colors.red.shade800,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            if (onChanged != null) {
              onChanged!(!isCompletedd);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: isCompletedd
                  ? Colors.green
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                text,
                style: TextStyle(
                  color: isCompletedd
                      ? Colors.white
                      : Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              leading: Checkbox(
                value: isCompletedd,
                onChanged: onChanged,
                activeColor: Colors.green,
                shape: ContinuousRectangleBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

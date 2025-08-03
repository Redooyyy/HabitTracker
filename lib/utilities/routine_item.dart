import 'package:flutter/material.dart';

class RoutineItem extends StatelessWidget {
  final String week;
  final double height;
  final double width;
  final Color? color;
  const RoutineItem({
    super.key,
    required this.week,
    this.height = 50,
    this.width = 100,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeColor = color ?? Theme.of(context).colorScheme.secondary;
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        color: activeColor,
        child: Center(
          child: Text(
            week.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: 'Arial',
            ),
          ),
        ),
      ),
    );
  }
}

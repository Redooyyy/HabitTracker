import 'package:flutter/material.dart';

class MySubject extends StatelessWidget {
  final String subject;
  final Color? color;
  final double h8;
  final double w8;
  const MySubject({
    super.key,
    required this.subject,
    this.color,
    this.h8 = 70,
    this.w8 = 120,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeColor = color ?? Theme.of(context).colorScheme.secondary;
    return SizedBox(
      height: h8,
      width: w8,
      child: Card(
        color: activeColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                textAlign: TextAlign.center,
                subject.toString(),
                style: TextStyle(fontSize: 15, fontFamily: 'Arial'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

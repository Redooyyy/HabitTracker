import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final Icon icon;
  final String tileTitile;
  void Function()? onTap;

  DrawerTile({
    super.key,
    required this.icon,
    required this.tileTitile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: ListTile(
          leading: icon,
          title: Text(tileTitile, style: TextStyle(fontSize: 20)),
          onTap: onTap,
        ),
      ),
    );
  }
}

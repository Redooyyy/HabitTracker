import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hab8/components/drawer_tile.dart';
import 'package:hab8/components/my_signature.dart';
import 'package:hab8/databse/my_contacts.dart';
import 'package:hab8/pages/routine_page.dart';
import 'package:hab8/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  final String Facebook = "https://www.facebook.com/share/1AiUpc6qKT/";
  final String Github = "https://github.com/Redooyyy";
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(child: SignatureBanner()),
          DrawerTile(
            icon: Icon(Icons.book),
            tileTitile: "Routine",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoutinePage()),
              );
            },
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dark/Light",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (value) => Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).switchTheme(),
              ),
            ],
          ),

          Spacer(),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                IconButton(
                  onPressed: () async => await launchURL(Facebook),
                  icon: Icon(Icons.facebook_rounded, size: 42),
                ),
                IconButton(
                  onPressed: () async => await launchURL(Github),
                  icon: Opacity(
                    opacity: .85,
                    child: Image.asset("lib/assets/github.png", height: 50),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Opacity(
                    opacity: .70,
                    child: Image.asset(
                      "lib/assets/linkedin.png",
                      height: 50,
                      color: whiteorblack(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color whiteorblack(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.white : Colors.black;
  }
}

import 'package:flutter/material.dart';
import 'package:hab8/databse/hav8_database.dart';
import 'package:hab8/pages/home_page.dart';
import 'package:hab8/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initializing database
  await Hav8Database.initialize();
  final db = Hav8Database();
  await db.saveFirstDate();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => db),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

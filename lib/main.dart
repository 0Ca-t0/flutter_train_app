import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/home_page.dart';
import 'package:flutter_train_app/pages/seat_page/seat_page.dart';
import 'package:flutter_train_app/pages/station_list/station_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple, brightness: Brightness.light),
          dividerColor: Colors.grey[300],
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple, brightness: Brightness.dark),
          dividerColor: Colors.black,
        ),
        home: HomePage());
  }
}

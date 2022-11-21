import 'package:flutter/material.dart';
import 'package:vignesh/home.dart';
import 'package:vignesh/screens/user_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vignesh - Simple Nav Bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
            iconTheme: IconThemeData(color: Colors.black)),
        primarySwatch: Colors.purple,
      ),
      home: const Home(),
      routes: {
        // "/": (context) => Home(),
        UserDetailsScreen.routeName: (context) => UserDetailsScreen(),
      },
    );
  }
}

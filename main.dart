import 'package:flutter/material.dart'; // Importing the Flutter material package for UI components
import 'package:goodmorning/modules/HomeScreen.dart'; // Importing HomeScreen module

void main() {
  runApp(const MyApp()); // Running the main application widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      title: 'Flutter Task List', // Setting the application title
      theme: ThemeData(
        primarySwatch: Colors.blue, // Setting the primary color theme
      ),
      home: const HomeScreen(), // Setting HomeScreen as the home widget
    );
  }
}

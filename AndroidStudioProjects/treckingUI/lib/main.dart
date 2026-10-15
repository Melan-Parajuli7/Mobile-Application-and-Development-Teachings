import 'package:flutter/material.dart';
import 'package:treckingui/screens/landing_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TrekNepal",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const landingScreen(),
    );
  }
}

  
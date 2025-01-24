import 'package:bia_app/presentation/energy_rating/screens/energy_rating_screen.dart';
import 'package:flutter/material.dart';
import 'assets/configs/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final key = GlobalKey();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BIA App',
      theme: AppTheme.darkTheme,
      home: const EnergyRatingScreen(),
    );
  }
}

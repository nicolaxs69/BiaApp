import 'package:flutter/material.dart';
import 'assets/configs/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIA App',
      theme: AppTheme.darkTheme,
      home: Container(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_color_scheme_sample/presentation/root.dart';
import 'package:flutter_color_scheme_sample/theme/app_color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: AppColorScheme.light,
      ),
      home: Root(),
      debugShowCheckedModeBanner: false,
    );
  }
}

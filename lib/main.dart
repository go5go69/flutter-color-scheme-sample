import 'package:flutter/material.dart';
import 'package:flutter_color_scheme_sample/theme/color_scheme_provider.dart';
import 'package:flutter_color_scheme_sample/presentation/root.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = ref.watch(colorSchemeProvider);

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: cs,
      ),
      home: Root(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_color_scheme_sample/presentation/widgets/color_scheme_swatch.dart';

class CodeTab extends StatelessWidget {
  const CodeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: ColorSchemeSwatch(
        colorScheme: cs,
      ),
    );
  }
}

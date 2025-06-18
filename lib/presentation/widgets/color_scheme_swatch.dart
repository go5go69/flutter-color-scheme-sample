import 'package:flutter/material.dart';

class ColorSchemeSwatch extends StatelessWidget {
  final ColorScheme colorScheme;
  const ColorSchemeSwatch({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    final entries = <MapEntry<String, Color>>[
      MapEntry('primary', colorScheme.primary),
      MapEntry('onPrimary', colorScheme.onPrimary),
      MapEntry('secondary', colorScheme.secondary),
      MapEntry('onSecondary', colorScheme.onSecondary),
      MapEntry('error', colorScheme.error),
      MapEntry('onError', colorScheme.onError),
      MapEntry('surface', colorScheme.surface),
      MapEntry('onSurface', colorScheme.onSurface),
      MapEntry('outline', colorScheme.outline),
      MapEntry('outlineVariant', colorScheme.outlineVariant),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('■ AppColorScheme.light',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: entries.map((entry) {
            final color = entry.value;
            final label = entry.key;
            final textColor =
                ThemeData.estimateBrightnessForColor(color) == Brightness.dark
                    ? Colors.white
                    : Colors.black;
            return Container(
              width: 110,
              height: 60,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

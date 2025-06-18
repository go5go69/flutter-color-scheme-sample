import 'package:flutter/material.dart';
import 'package:flutter_color_scheme_sample/theme/color_scheme_provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ref.watch(colorSchemeProvider);
    final notifier = ref.read(colorSchemeProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('ColorScheme Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ColorSelector(
            label: 'primary',
            current: colorScheme.primary,
            onChanged: (c) => notifier.update(primary: c),
          ),
          _ColorSelector(
            label: 'onPrimary',
            current: colorScheme.onPrimary,
            onChanged: (c) => notifier.update(onPrimary: c),
          ),
          _ColorSelector(
            label: 'primaryContainer',
            current: colorScheme.primaryContainer,
            onChanged: (c) => notifier.update(primaryContainer: c),
          ),
          _ColorSelector(
            label: 'secondary',
            current: colorScheme.secondary,
            onChanged: (c) => notifier.update(secondary: c),
          ),
          _ColorSelector(
            label: 'onSecondary',
            current: colorScheme.onSecondary,
            onChanged: (c) => notifier.update(onSecondary: c),
          ),
          _ColorSelector(
            label: 'error',
            current: colorScheme.error,
            onChanged: (c) => notifier.update(error: c),
          ),
          _ColorSelector(
            label: 'onError',
            current: colorScheme.onError,
            onChanged: (c) => notifier.update(onError: c),
          ),
          _ColorSelector(
            label: 'surface',
            current: colorScheme.surface,
            onChanged: (c) => notifier.update(surface: c),
          ),
          _ColorSelector(
            label: 'onSurface',
            current: colorScheme.onSurface,
            onChanged: (c) => notifier.update(onSurface: c),
          ),
          _ColorSelector(
            label: 'outline',
            current: colorScheme.outline,
            onChanged: (c) => notifier.update(outline: c),
          ),
          _ColorSelector(
            label: 'outlineVariant',
            current: colorScheme.outlineVariant,
            onChanged: (c) => notifier.update(outlineVariant: c),
          ),
        ],
      ),
    );
  }
}

class _ColorSelector extends StatelessWidget {
  final String label;
  final Color current;
  final ValueChanged<Color> onChanged;

  const _ColorSelector({
    required this.label,
    required this.current,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: GestureDetector(
        onTap: () async {
          final newColor = await showDialog<Color>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('$label を選択'),
              content: SingleChildScrollView(
                child: BlockPicker(
                  pickerColor: current,
                  availableColors: [
                    ...Colors.primaries.map((c) => c),
                    Colors.white, // white を追加
                  ],
                  onColorChanged: (c) => Navigator.of(context).pop(c),
                ),
              ),
            ),
          );
          if (newColor != null) {
            onChanged(newColor);
          }
        },
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: current,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_color_scheme_sample/presentation/widgets/section_card.dart';

class WidgetTab extends StatefulWidget {
  const WidgetTab({super.key});

  @override
  State<WidgetTab> createState() => _WidgetTabState();
}

class _WidgetTabState extends State<WidgetTab> {
  bool _check = true;
  bool _switch = true;
  int _radio = 0;
  double _slider = 0.5;
  final _tf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Section(
            title: 'ElevatedButton\n→ surface / primary',
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),
          ),
          Section(
            title: 'FilledButton\n→ primary / onPrimary',
            child: FilledButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),
          ),
          Section(
            title: 'OutlinedButton\n→ outline / primary',
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton'),
            ),
          ),
          Section(
            title: 'TextButton\n→ primary',
            child: TextButton(
              onPressed: () {},
              child: const Text('TextButton'),
            ),
          ),
          Section(
            title: 'Switch / Checkbox / Radio\n→ activeColor は primary',
            child: Column(
              children: [
                Switch(
                  value: _switch,
                  onChanged: (v) => setState(() => _switch = v),
                ),
                Checkbox(
                  value: _check,
                  onChanged: (v) => setState(() => _check = v ?? false),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (i) => Radio<int>(
                      value: i,
                      groupValue: _radio,
                      onChanged: (v) => setState(() => _radio = v ?? 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Section(
            title: 'Divider\n→ outlineVariant',
            child: const Divider(),
          ),
          Section(
            title: 'TextField（エラー表示）\n→ error / onError / outline',
            child: TextField(
              controller: _tf,
              decoration: const InputDecoration(
                labelText: '入力してエラーにしてみてください',
                errorText: 'エラー例',
              ),
            ),
          ),
          Section(
            title: 'Container with surface / onSurface',
            child: Container(
              padding: const EdgeInsets.all(12),
              color: cs.surface,
              child: Text(
                'surface の背景\nonSurface のテキスト',
                style: TextStyle(color: cs.onSurface),
              ),
            ),
          ),
          Section(
            title: 'Chip（selectedColor に secondary）',
            child: ChoiceChip(
              label: const Text('ChoiceChip'),
              selected: true,
              onSelected: (_) {},
            ),
          ),
          Section(
            title: 'Card & ListTile (surface / onSurface)',
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('ListTile inside Card'),
                subtitle: const Text('surface 背景 & onSurface 文字'),
              ),
            ),
          ),
          Section(
            title: 'ProgressIndicator → primary',
            child: Column(
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 12),
                LinearProgressIndicator(),
              ],
            ),
          ),
          Section(
            title: 'Slider → activeColor は primary',
            child: Column(
              children: [
                Slider(
                  value: _slider,
                  onChanged: (v) => setState(() => _slider = v),
                ),
                Text('値: ${(_slider * 100).round()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

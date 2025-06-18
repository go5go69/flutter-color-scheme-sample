import 'package:flutter/material.dart';
import 'package:flutter_color_scheme_sample/theme/app_color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ColorScheme Visual Test',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: AppColorScheme.light,
      ),
      home: const ColorSchemeViewer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ColorSchemeViewer extends StatefulWidget {
  const ColorSchemeViewer({super.key});
  @override
  State<ColorSchemeViewer> createState() => _ColorSchemeViewerState();
}

class _ColorSchemeViewerState extends State<ColorSchemeViewer> {
  bool _check = true;
  bool _switch = true;
  int _radio = 0;
  int _navIndex = 0;
  double _slider = 0.5;
  final _tf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ColorScheme Viewer'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.widgets)),
              Tab(icon: Icon(Icons.code)),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => _showErrorSnackBar(context),
              child: const Icon(Icons.error),
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () => _showErrorSnackBar(context),
              child: const Icon(Icons.error),
            ),
            SizedBox(height: 16),
            FloatingActionButton.extended(
              heroTag: 'sheet',
              onPressed: () => _showBottomSheet(context),
              icon: const Icon(Icons.expand_less),
              label: const Text('Sheet'),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _navIndex,
          onDestinationSelected: (i) => setState(() => _navIndex = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.star), label: 'Star'),
            NavigationDestination(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _Section(
                title: 'ElevatedButton\n→ primary / onPrimary',
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('ElevatedButton'),
                ),
              ),
              _Section(
                title: 'OutlinedButton\n→ outline',
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('OutlinedButton'),
                ),
              ),
              _Section(
                title:
                    'TextButton（フォアグラウンドを secondary に上書き）\n→ secondary / onSecondary',
                child: TextButton(
                  onPressed: () {},
                  child: const Text('TextButton'),
                ),
              ),
              _Section(
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
              _Section(
                title: 'Divider\n→ outlineVariant',
                child: const Divider(),
              ),
              _Section(
                title: 'TextField（エラー表示）\n→ error / onError / outline',
                child: TextField(
                  controller: _tf,
                  decoration: const InputDecoration(
                    labelText: '入力してエラーにしてみてください',
                    errorText: 'エラー例',
                  ),
                ),
              ),
              _Section(
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
              _Section(
                title: 'Chip（selectedColor に secondary）',
                child: ChoiceChip(
                  label: const Text('ChoiceChip'),
                  selected: true,
                  onSelected: (_) {},
                ),
              ),
              _Section(
                title: 'Card & ListTile (surface / onSurface)',
                child: Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('ListTile inside Card'),
                    subtitle: const Text('surface 背景 & onSurface 文字'),
                  ),
                ),
              ),
              _Section(
                title: 'ProgressIndicator → primary',
                child: Column(
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 12),
                    LinearProgressIndicator(),
                  ],
                ),
              ),
              _Section(
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
        ),
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: cs.error, // ← error
        content: Text(
          'SnackBar : error 背景 / onError 文字',
          style: TextStyle(color: cs.onError),
        ),
        action: SnackBarAction(
          label: 'DISMISS',
          textColor: cs.onError,
          onPressed: () {},
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext ctx) {
  final cs = Theme.of(ctx).colorScheme;

  showModalBottomSheet(
    context: ctx,
    showDragHandle: true, // M3 のハンドル
    builder: (context) => Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('ModalBottomSheet',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('閉じる (primary / onPrimary)'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {},
            child: const Text('OutlinedButton (outline)'),
          ),
          const SizedBox(height: 8),
          Text(
            'surface 上のテキスト (onSurface)',
            style: TextStyle(color: cs.onSurface),
          ),
        ],
      ),
    ),
  );
}

/// セクション見出し付きカード
class _Section extends StatelessWidget {
  final String title;
  final Widget child;
  const _Section({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: cs.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

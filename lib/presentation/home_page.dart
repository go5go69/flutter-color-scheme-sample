import 'package:flutter/material.dart';
import 'package:flutter_color_scheme_sample/presentation/tab_content/code_tab.dart';
import 'package:flutter_color_scheme_sample/presentation/tab_content/widget_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
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
        body: TabBarView(
          children: [
            WidgetTab(),
            CodeTab(),
          ],
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

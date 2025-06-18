import 'package:flutter/material.dart';

class DialogSnackSheetPage extends StatefulWidget {
  const DialogSnackSheetPage({super.key});

  @override
  State<DialogSnackSheetPage> createState() => _DialogSnackSheetPageState();
}

class _DialogSnackSheetPageState extends State<DialogSnackSheetPage> {
  void _showSnackBar() {
    final cs = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: cs.error,
        content: Text(
          'SnackBar (error / onError)',
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

  void _showBottomSheet() {
    final cs = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) => Container(
        color: cs.surface,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('BottomSheet', style: TextStyle(color: cs.onSurface)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('閉じる'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    final cs = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: cs.surface,
        title: Text('Dialog Title', style: TextStyle(color: cs.onSurface)),
        content: Text('これはダイアログです。', style: TextStyle(color: cs.onSurface)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('キャンセル'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          FilledButton(
            onPressed: _showSnackBar,
            child: const Text('Show SnackBar'),
          ),
          FilledButton(
            onPressed: _showBottomSheet,
            child: const Text('Show BottomSheet'),
          ),
          FilledButton(
            onPressed: _showDialog,
            child: const Text('Show Dialog'),
          ),
        ],
      ),
    );
  }
}

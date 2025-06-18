import 'package:flutter/material.dart';

class DialogSnackSheetPage extends StatefulWidget {
  const DialogSnackSheetPage({super.key});

  @override
  State<DialogSnackSheetPage> createState() => _DialogSnackSheetPageState();
}

class _DialogSnackSheetPageState extends State<DialogSnackSheetPage> {
  void _showDefaultSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'SnackBar (default)',
        ),
        action: SnackBarAction(
          label: 'DISMISS',
          onPressed: () {},
        ),
      ),
    );
  }

  void _showErrorSnackBar() {
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
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('BottomSheet'),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('閉じる'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('AlertDialog'),
        content: Text('これはAlertDialogです。'),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog & SnackBar'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              FilledButton(
                onPressed: _showDefaultSnackBar,
                child: const Text('Show DefaultSnackBar'),
              ),
              SizedBox(height: 16),
              FilledButton(
                onPressed: _showErrorSnackBar,
                child: const Text('Show ErrorSnackBar'),
              ),
              SizedBox(height: 16),
              FilledButton(
                onPressed: _showBottomSheet,
                child: const Text('Show BottomSheet'),
              ),
              SizedBox(height: 16),
              FilledButton(
                onPressed: _showDialog,
                child: const Text('Show AlertDialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

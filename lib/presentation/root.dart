import 'package:flutter/material.dart';
import 'package:flutter_color_scheme_sample/presentation/pages/dialog_snack_sheet_page.dart';
import 'package:flutter_color_scheme_sample/presentation/pages/home_page.dart';
import 'package:flutter_color_scheme_sample/presentation/pages/setting_page.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      HomePage(),
      DialogSnackSheetPage(),
      SettingPage(),
    ];
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 768),
          child: pages[_navIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _navIndex,
        onDestinationSelected: (i) => setState(() => _navIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.call_to_action_outlined),
            label: 'Overlay',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

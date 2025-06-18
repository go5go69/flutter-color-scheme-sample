import 'package:flutter/material.dart';
import 'package:flutter_color_scheme_sample/presentation/tab_content/code_tab.dart';
import 'package:flutter_color_scheme_sample/presentation/tab_content/widget_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Widget & Code'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.widgets)),
              Tab(icon: Icon(Icons.code)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.crop_free),
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
}

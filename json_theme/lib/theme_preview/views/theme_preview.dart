import 'package:flutter/material.dart';

import 'buttons_page.dart';
import 'inputs_page.dart';
import 'preview_body.dart';
import 'selections_page.dart';
import 'text_page.dart';

class ThemePreview extends StatelessWidget {
  const ThemePreview({required this.theme, Key? key}) : super(key: key);

  static const List<PreviewBody> _pages = [
    ButtonsPage(),
    InputsPage(),
    SelectionsPage(),
    TextPage(),
  ];

  final ThemeData theme;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: DefaultTabController(
          length: _pages.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Theme Preview'),
              actions: [
                Row(
                  children: [
                    const Text('1'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications),
                    ),
                  ],
                ),
              ],
              bottom: TabBar(
                tabs: _pages
                    .map(
                      (page) => Tab(
                        text: page.label,
                        icon: Icon(page.icon),
                      ),
                    )
                    .toList(),
              ),
            ),
            body: const TabBarView(children: _pages),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            drawer: _Drawer(),
            bottomNavigationBar: _BottomNavigationBar(),
          ),
        ),
        title: 'Theme',
        theme: theme,
        debugShowCheckedModeBanner: false,
      );
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Drawer header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      );
}

class _BottomNavigationBar extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
      );
}

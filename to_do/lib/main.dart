import 'package:flutter/material.dart';
import 'themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: textTheme,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      themeAnimationDuration: const Duration(milliseconds: 500),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.responsiveWidth = 600});

  final num responsiveWidth;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int navigationIndex = 0;

  final List<Widget> _screens = const [
    // ToDo list
    Center(
      child: Text('ToDo List'),
    ),
    // Completed tasks
    Center(
      child: Text('Completed Tasks'),
    ),
    // Settings
    Center(
      child: Text('Settings'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          MediaQuery.of(context).size.width < widget.responsiveWidth
              ? NavigationBar(
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.list),
                      label: 'ToDo List',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.check),
                      label: 'Completed Tasks',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                  selectedIndex: navigationIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      navigationIndex = index;
                    });
                  },
                )
              : null,
      body: Row(
        children: [
          MediaQuery.of(context).size.width < widget.responsiveWidth
              ? Container()
              : NavigationRail(
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.list),
                      label: Text('ToDo List'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.check),
                      label: Text('Completed Tasks'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text('Settings'),
                    ),
                  ],
                  selectedIndex: navigationIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      navigationIndex = index;
                    });
                  },
                ),
          Expanded(
            child: _screens[navigationIndex],
          )
        ],
      ),
    );
  }
}

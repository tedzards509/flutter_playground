import 'package:flutter/material.dart';
import 'themes.dart';
import 'modules/taskview.dart';

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
      home: const MyNavigation(),
    );
  }
}

class MyNavigation extends StatefulWidget {
  const MyNavigation({super.key, this.responsiveThreshold = 600});

  final num responsiveThreshold;

  @override
  State<MyNavigation> createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  int navigationIndex = 0;

  final List<Widget> _screens = [
    // ToDo list
    Center(
      child: TaskList(
        tasks: _testTaskList,
      ),
    ),
    // Settings
    const Center(
      child: Text('Settings'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          MediaQuery.of(context).size.width < widget.responsiveThreshold
              ? NavigationBar(
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.check_circle_rounded),
                      label: 'ToDo List',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.settings_rounded),
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
          MediaQuery.of(context).size.width < widget.responsiveThreshold
              ? Container()
              : NavigationRail(
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.check_circle_rounded),
                      label: Text('ToDo List'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings_rounded),
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

List<Task> _testTaskList = [
  Task(title: 'Test Task', id: 0),
  Task(title: "title", id: 1),
];

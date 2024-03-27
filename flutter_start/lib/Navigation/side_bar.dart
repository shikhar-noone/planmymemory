import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:side_navigation/side_navigation.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({super.key});

  @override
  State<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends State<HomeSideBar> {
  /// Views to display
  List<Widget> views = const [
    Center(
      child: Text('Dashboard'),
    ),
    Center(
      child: Text('Account'),
    ),
    Center(
      child: Text('Logout'),
    ),
  ];

  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// You can use an AppBar if you want to
      //appBar: AppBar(
      //  title: const Text('App'),
      //),

      // The row is needed to display the current view
      body: Row(
        children: [
          /// Pretty similar to the BottomNavigationBar!
          SideNavigationBar(
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.dashboard,
                label: 'Dashboard',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Account',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Logout',
              ),
            ],
            footer: const SideNavigationBarFooter(label: ButtonBar()),
            onTap: (index) {
              setState(() {
                selectedIndex = index;
                if (selectedIndex == views.length - 1) {
                  final sessionManager = SessionManager();
                  sessionManager.remove("token");
                  Navigator.pushNamed(context, "/signin");
                }
              });
            },
          ),

          /// Make it take the rest of the available width
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}

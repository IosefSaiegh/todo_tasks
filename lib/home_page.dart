import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tareas/pages/fijadas.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

/// This is the private State class that goes with HomePage.
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          SafeArea(
            child: NavigationRail(
              leading: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'To Do Tasks',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedLabelTextStyle: GoogleFonts.montserrat(),
              labelType: NavigationRailLabelType.selected,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.push_pin_outlined),
                  selectedIcon: Icon(Icons.push_pin),
                  label: Text('Fijados'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.bookmark),
                  label: Text('Etiquetas'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.task_alt_rounded),
                  selectedIcon: Icon(Icons.task_alt_outlined),
                  label: Text(
                    'Todas las \n tareas',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Fijadas(),
          )
        ],
      ),
    );
  }
}

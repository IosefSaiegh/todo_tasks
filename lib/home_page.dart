import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:tareas/pages/etiquetas.dart';
import 'package:tareas/pages/fijadas.dart';
import 'package:tareas/pages/todas.dart';
import 'package:tareas/providers/ui_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

/// This is the private State class that goes with HomePage.
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    int _selectedIndex = uiProvider.selectedMenuOpt;
    // DBProvider.db.database;
    return Scaffold(
      body: Row(
        children: <Widget>[
          SafeArea(
            child: NavigationRail(
              leading: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'ToDo List',
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
                uiProvider.selectedMenuOpt = index;
              },
              selectedLabelTextStyle: GoogleFonts.montserrat(),
              labelType: NavigationRailLabelType.selected,
              // elevation: 10.0,
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
          _selectedIndex == 0
              ? const Expanded(child: Fijadas())
              : _selectedIndex == 1
                  ? const Expanded(child: Etiquetas())
                  : const Expanded(child: TodasLasTareas())
        ],
      ),
    );
  }
}

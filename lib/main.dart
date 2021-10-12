import 'package:flutter/material.dart';
import 'package:tareas/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:tareas/providers/ui_provider.dart';
import 'package:tareas/screens/prefs_page.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo List',
        home: const HomePage(),
        theme: ThemeData.dark().copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue, //#2196f3
          ),
        ),
        routes: {
          'home': (context) => const HomePage(),
          'prefs': (context) => const PrefsScreen(),
        },
      ),
    );
  }

//   ThemeData darkMode(BuildContext context) {
//     final uiProvider = Provider.of<UiProvider>(context, {listen:});
//     bool darkMode = uiProvider.darkMode;
//     if (darkMode == true) {
//       return ThemeData.dark().copyWith(
//           floatingActionButtonTheme: const FloatingActionButtonThemeData(
//         backgroundColor: Colors.blue, //#2196f3
//       ));
//     } else {
//       return ThemeData.light();
//     }
//   }
}

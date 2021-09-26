import 'package:flutter/material.dart';
import 'package:tareas/home_page.dart';
import 'package:provider/provider.dart';
import 'package:tareas/providers/ui_provider.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo Tasks',
        home: const HomePage(),
        theme: ThemeData.dark().copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue, //#2196f3
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:group_radio_button/group_radio_button.dart';
// import 'package:tareas/providers/ui_provider.dart';

class PrefsScreen extends StatefulWidget {
  const PrefsScreen({Key? key}) : super(key: key);

  @override
  State<PrefsScreen> createState() => _PrefsScreenState();
}

class _PrefsScreenState extends State<PrefsScreen> {
  @override
  Widget build(BuildContext context) {
    // final uiProvider = Provider.of<UiProvider>(context);
    // bool darkMode = uiProvider.darkMode;
    bool dark = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configuracion',
          style: GoogleFonts.montserrat(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ListTile(
              title: Text(
                'Tema',
                style: GoogleFonts.montserrat(),
              ),
              trailing: const Icon(Icons.brightness_6_outlined),
              onTap: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      title: Text(
                        'Tema de App',
                        style: GoogleFonts.montserrat(),
                        textAlign: TextAlign.center,
                      ),
                      content: Column(
                        children: [
                          Switch(
                            onChanged: (bool value) {
                              setState(() {
                                dark = value;
                              });
                            },
                            value: dark,
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 35.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

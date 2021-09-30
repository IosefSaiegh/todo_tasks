import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tareas/models/argumentos_detalle.dart';
// import 'package:tareas/models/argumentos_detalle.dart';

class DetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DetalleArguments? args =
        ModalRoute.of(context)!.settings.arguments as DetalleArguments?;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              args!.titulo,
              style: GoogleFonts.montserrat(
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tareas/models/tarea_model.dart';
// import 'package:tareas/models/argumentos_detalle.dart';

class DetallePage extends StatefulWidget {
  const DetallePage({Key? key}) : super(key: key);

  @override
  State<DetallePage> createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  @override
  Widget build(BuildContext context) {
    final Tarea? args = ModalRoute.of(context)!.settings.arguments as Tarea?;
    final tamanioDeDispositivo = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Row(
            children: [
              args!.titulo.length > 70
                  ? SizedBox(
                      width: tamanioDeDispositivo.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          args.titulo,
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        args.titulo,
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                      ),
                    ),
              args.completado == true
                  ? Row(
                      children: [
                        const Icon(
                          Icons.done,
                          color: Colors.blue,
                          size: 25,
                        ),
                        Text(
                          'Completado',
                          style: GoogleFonts.montserrat(
                            color: Colors.blue,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const Icon(
                          Icons.close_rounded,
                          color: Colors.red,
                          size: 25,
                        ),
                        Text(
                          'No Completado',
                          style: GoogleFonts.montserrat(
                            color: Colors.red,
                            fontSize: 25,
                          ),
                        )
                      ],
                    ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              args.descripcion,
              style: GoogleFonts.montserrat(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: Text(
              'Marcar como completado',
              style: GoogleFonts.montserrat(),
            ),
          )
        ],
      ),
    );
  }
}

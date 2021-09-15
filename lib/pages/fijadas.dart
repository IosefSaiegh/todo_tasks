import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tareas/widgets/tarea.dart';

class Fijadas extends StatefulWidget {
  @override
  State<Fijadas> createState() => _FijadasState();
}

class _FijadasState extends State<Fijadas> {
  final opciones = [];
  bool completado = false;
  final tituloTarea = TextEditingController();
  String nuevoValor = '';
  TextStyle? fuenteMontserrat = GoogleFonts.montserrat();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: crearItems(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Alert(
              context: context,
              title: 'Tarea',
              style: AlertStyle(
                titleStyle: GoogleFonts.montserrat(),
              ),
              content: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.title_rounded),
                      labelText: 'Titulo',
                      labelStyle: fuenteMontserrat,
                    ),
                    controller: tituloTarea,
                    style: fuenteMontserrat,
                    onChanged: (newValue) {
                      setState(() {
                        nuevoValor = newValue;
                      });
                    },
                  ),
                ],
              ),
              buttons: [
                DialogButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Crear Tarea',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ).show();
          });
          setState(() {
            opciones.add(tituloTarea.text);
          });
        },
        child: const Icon(Icons.add_task_rounded),
      ),
    );
  }

  List<Widget> crearItems() {
    final lista = <Widget>[];
    for (String opt in opciones) {
      final tempWidget = TareaListTile(
        titulo: opt == nuevoValor
            ? Text(
                opt,
                style: fuenteMontserrat,
              )
            : Text(
                nuevoValor,
                style: fuenteMontserrat,
              ),
        completado: completado,
        iconCompletado: IconButton(
          icon: const Icon(
            Icons.clear_rounded,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              completado = false;
            });
          },
        ),
        iconNoCompletado: IconButton(
          icon: const Icon(
            Icons.task_alt_rounded,
            color: Colors.blue,
          ),
          onPressed: () {
            setState(() {
              completado = true;
            });
          },
        ),
        iconBorrar: IconButton(
          onPressed: () {
            setState(() {
              opciones.remove(opt);
            });
          },
          icon: const Icon(Icons.delete_outline),
          color: Colors.red,
        ),
      );
      lista.add(tempWidget);
      lista.add(const Divider());
    }

    return lista;
  }
}

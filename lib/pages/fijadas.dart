import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tareas/widgets/tarea.dart';

class Fijadas extends StatefulWidget {
  const Fijadas({Key? key}) : super(key: key);

  @override
  State<Fijadas> createState() => _FijadasState();
}

class _FijadasState extends State<Fijadas> {
  bool completado = false;
  TextStyle? fuenteMontserrat = GoogleFonts.montserrat();
  String nuevoValor = '';
  final opciones = [];
  final tituloTarea = TextEditingController();
  bool disabledBtn = true;

  List<Widget> crearItems() {
    final lista = <Widget>[];
    for (String opt in opciones) {
      nuevoValor = opt;
      final tempWidget = TareaListTile(
        titulo: Text(
          opt,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: crearItems(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              _showMyDialog();
            },
          );
        },
        child: const Icon(Icons.add_task_rounded),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tarea'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.title_rounded),
                    labelText: 'Titulo',
                    labelStyle: fuenteMontserrat,
                  ),
                  controller: tituloTarea,
                  style: fuenteMontserrat,
                  onSubmitted: (newValue) {
                    setState(() {
                      opciones.add(newValue);
                      disabledBtn = false;
                    });
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  opciones.remove(nuevoValor);
                });
              },
              child: Text(
                'Cancelar',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            disabledBtn == false
                ? TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Guardar',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[400]),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}

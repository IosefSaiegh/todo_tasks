import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tareas/widgets/tarea.dart';

class Fijadas extends StatefulWidget {
  const Fijadas({Key? key}) : super(key: key);

  @override
  State<Fijadas> createState() => _FijadasState();
}

class _FijadasState extends State<Fijadas> {
  TextStyle? fuenteMontserrat = GoogleFonts.montserrat();
  String nuevoValor = '';
  final opciones = [];
  final tituloTarea = TextEditingController();
  bool disabledBtn = true;
  bool completado = false;

  List<Widget> crearItems() {
    final lista = <Widget>[];
    for (String opt in opciones) {
      nuevoValor = opt;
      final tempWidget = TareaListTile(
        titulo: Text(
          opt,
          style: fuenteMontserrat,
        ),
        iconCompletar: completado == true
            ? IconButton(
                icon: const Icon(
                  Icons.clear_rounded,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    completado = false;
                  });
                },
              )
            : IconButton(
                icon: const Icon(
                  Icons.task_alt_rounded,
                  color: Colors.blue,
                ),
                onPressed: () {
                  setState(() {
                    setState(() {
                      completado = true;
                    });
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
    showModalBottomSheet(
      context: context,
      shape: ShapeBorder.lerp(
        const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )),
        const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )),
        20,
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 50.0,
          ),
          child: Column(
            children: [
              Text(
                'Crear tarea',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              SingleChildScrollView(
                child: ListBody(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 150,
                        vertical: 15.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow[600],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.info_outline_rounded,
                              size: 25.0,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Presiona Enter para guardar la tarea',
                              style: GoogleFonts.raleway(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

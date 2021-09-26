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

  List<Widget> crearItems() {
    final lista = <Widget>[];
    for (String opt in opciones) {
      nuevoValor = opt;
      final tempWidget = TareaListTile(
        titulo: Text(
          opt,
          style: fuenteMontserrat,
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
          ),
        ),
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 17.5,
                          color: Colors.yellow[700],
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Presiona Enter para guardar la tarea',
                          style: GoogleFonts.raleway(
                            fontSize: 17.5,
                            color: Colors.yellow[700],
                          ),
                        ),
                      ],
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

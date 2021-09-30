import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tareas/widgets/tarea.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle? fuenteMontserrat = GoogleFonts.montserrat();
  String nuevoValor = '';
  final opciones = [];
  final tituloTarea = TextEditingController();

  List<Widget> crearItems() {
    final lista = <Widget>[];
    for (String opt in opciones) {
      nuevoValor = opt;
      final tempWidget = TareaListTile(
        titulo: opt,
        iconBorrar: IconButton(
          splashRadius: 20.0,
          onPressed: () {
            setState(() {
              opciones.remove(opt);
            });
          },
          icon: const Icon(Icons.delete_outline),
          color: Colors.red,
        ),
        // iconEditar: IconButton(
        //   splashRadius: 20.0,
        //   onPressed: () {
        //     setState(() {

        //     });
        //   },
        //   icon: const Icon(Icons.edit_outlined),
        //   color: Colors.blue,
        // ),
      );
      lista.add(tempWidget);
      lista.add(
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Divider(),
        ),
      );
    }

    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo List',
          style: GoogleFonts.montserrat(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: crearItems(),
        ),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                          tituloTarea.text = '';
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

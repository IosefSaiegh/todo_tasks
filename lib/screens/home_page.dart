import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/painting.dart';
import 'package:tareas/models/tarea_model.dart';
import 'dart:io' show Platform;

import 'package:tareas/widgets/tarea.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle? fuenteMontserrat = GoogleFonts.montserrat();
  final tituloTarea = TextEditingController();
  final descripcionTarea = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Tarea> listaTareas = [
      // Tarea(
      //   titulo: 'hola',
      //   descripcion: 'ouvfh',
      //   completado: false,
      // )
    ];
    // DBProvider.db.database;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo List',
          style: GoogleFonts.montserrat(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'prefs');
          },
          icon: const Icon(Icons.settings_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: listaTareas.isNotEmpty
            ? ListView.builder(
                itemCount: listaTareas.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return TareaListTile(
                    titulo: listaTareas[index].titulo,
                    descripcion: listaTareas[index].descripcion,
                    iconBorrar: IconButton(
                      splashRadius: 20.0,
                      onPressed: () {
                        setState(() {
                          listaTareas.remove(listaTareas[index]);
                        });
                      },
                      icon: const Icon(Icons.delete_outline),
                      color: Colors.red,
                    ),
                    completado: listaTareas[index].completado,
                    iconEditar: IconButton(
                      splashRadius: 20.0,
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(Icons.edit_outlined),
                      color: Colors.blue,
                    ),
                  );
                  // return Text(listaTareas[index].titulo);
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tu lista de tareas esta vacia',
                      style: GoogleFonts.montserrat(fontSize: 20),
                    )
                  ],
                ),
              ),
      ),

      //FFFFFFFFFF    OOOOOOOOOOOO    RRRRRRRRR   MM          MM
      //FFFFFFFFFF    OOOOOOOOOOOO    RRRRRRRRR   MMMM      MMMM
      //FF            OO        OO    RR     RR   MM  MM  MM  MM
      //FFFFFFFF      OO        OO    RRRRRRRRR   MM    MM    MM
      //FFFFFFFF      OO        OO    RRRRR       MM          MM
      //FF            OOOOOOOOOOOO    RR   RR     MM          MM
      //FF            OOOOOOOOOOOO    RR     RR   MM          MM

      floatingActionButton: Platform.isWindows == true
          ? FloatingActionButton.extended(
              onPressed: () {
                setState(() {
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
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            icon:
                                                const Icon(Icons.title_rounded),
                                            labelText: 'Titulo',
                                            labelStyle: fuenteMontserrat,
                                          ),
                                          controller: tituloTarea,
                                          style: fuenteMontserrat,
                                          onSaved: (newValue) {
                                            setState(() {});
                                          },
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            icon: const Icon(
                                                Icons.description_rounded),
                                            labelText: 'Descripcion',
                                            labelStyle: fuenteMontserrat,
                                          ),
                                          controller: descripcionTarea,
                                          style: fuenteMontserrat,
                                          onSaved: (newValue) {
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 30,
                                      horizontal: 400,
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        listaTareas.add(Tarea(
                                          titulo: tituloTarea.text,
                                          descripcion: descripcionTarea.text,
                                          completado: false,
                                        ));
                                        tituloTarea.text = '';
                                        descripcionTarea.text = '';

                                        _formKey.currentState!.save();
                                      },
                                      child: Text(
                                        'Crear',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                });
              },
              label: Text(
                'Agregar Tarea',
                style: GoogleFonts.montserrat(),
              ),
              icon: const Icon(Icons.add_task_rounded),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            )
          : FloatingActionButton(
              onPressed: () {
                setState(() {
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
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            icon:
                                                const Icon(Icons.title_rounded),
                                            labelText: 'Titulo',
                                            labelStyle: fuenteMontserrat,
                                          ),
                                          controller: tituloTarea,
                                          style: fuenteMontserrat,
                                          onSaved: (newValue) {
                                            setState(() {});
                                          },
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            icon: const Icon(
                                                Icons.description_rounded),
                                            labelText: 'Descripcion',
                                            labelStyle: fuenteMontserrat,
                                          ),
                                          controller: descripcionTarea,
                                          style: fuenteMontserrat,
                                          onSaved: (newValue) {
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 30,
                                      horizontal: 400,
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        _formKey.currentState!.save();
                                        listaTareas.add(Tarea(
                                          titulo: tituloTarea.text,
                                          descripcion: descripcionTarea.text,
                                          completado: false,
                                        ));
                                        tituloTarea.text = '';
                                        descripcionTarea.text = '';
                                      },
                                      child: Text(
                                        'Crear',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                });
              },
              child: const Icon(Icons.add_task_rounded),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
    );
  }
}

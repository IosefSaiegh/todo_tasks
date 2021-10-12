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
  final tituloTarea = TextEditingController();
  final descripcionTarea = TextEditingController();
  final tituloList = [];
  final descripcionList = [];
  final _formKey = GlobalKey<FormState>();
  // List<Widget> crearItems() {
  //   final lista = <Widget>[];
  //   for (String opt in tituloList) {
  //     nuevoValor = opt;
  //     final tempWidget = TareaListTile(
  //       titulo: opt,
  //       iconBorrar: IconButton(
  //         splashRadius: 20.0,
  //         onPressed: () {
  //           setState(() {
  //             tituloList.remove(opt);
  //           });
  //         },
  //         icon: const Icon(Icons.delete_outline),
  //         color: Colors.red,
  //       ),
// iconEditar: IconButton(
//   splashRadius: 20.0,
//   onPressed: () {
//     setState(() {

//     });
//   },
//   icon: const Icon(Icons.edit_outlined),
//   color: Colors.blue,
// ),
  //     );
  //     lista.add(tempWidget);
  //     lista.add(
  //       const Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 15.0),
  //         child: Divider(),
  //       ),
  //     );
  //   }

  //   return lista;
  // }

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
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'prefs');
          },
          icon: const Icon(Icons.settings_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: tituloList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return TareaListTile(
              titulo: tituloList[index],
              descripcion: descripcionList[index],
              iconBorrar: IconButton(
                splashRadius: 20.0,
                onPressed: () {
                  setState(() {
                    tituloList.remove(tituloList[index]);
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
          },
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.title_rounded),
                              labelText: 'Titulo',
                              labelStyle: fuenteMontserrat,
                            ),
                            controller: tituloTarea,
                            style: fuenteMontserrat,
                            onSaved: (newValue) {
                              setState(() {
                                tituloList.add(newValue);
                                tituloTarea.text = '';
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.description_rounded),
                              labelText: 'Descripcion',
                              labelStyle: fuenteMontserrat,
                            ),
                            controller: descripcionTarea,
                            style: fuenteMontserrat,
                            onSaved: (newValue) {
                              setState(() {
                                descripcionList.add(newValue);
                                descripcionTarea.text = '';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 100,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size.fromWidth(100),
                          ),
                        ),
                        onPressed: () {
                          _formKey.currentState!.save();
                        },
                        child: Text(
                          'Guardar',
                          style: GoogleFonts.montserrat(),
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
  }
}

// final SharedPreferences prefs = await SharedPreferences.getInstance();

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tareas/widgets/tarea.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     List<String> tituloList = ['hola', 'chau'];
//     List<String> descripcionList = ['jdjdj', 'kfkfkfk'];
//     return Scaffold(
//       body: ListView.builder(
//         itemBuilder: (BuildContext context, int index) {
//           return TareaListTile(
//             iconBorrar: IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.delete),
//             ),
//             titulo: tituloList[index],
//             subtitulo: descripcionList[index],
//           );
//         },
//         itemCount: tituloList.length,
//         physics: const BouncingScrollPhysics(),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             shape: ShapeBorder.lerp(
//               const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0),
//                 ),
//               ),
//               const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0),
//                 ),
//               ),
//               20,
//             ),
//             builder: (BuildContext context) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 15.0,
//                   horizontal: 50.0,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Crear tarea',
//                       style: GoogleFonts.montserrat(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SingleChildScrollView(
//                       child: ListBody(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.info_outline_rounded,
//                                 size: 17.5,
//                                 color: Colors.yellow[700],
//                               ),
//                               const SizedBox(
//                                 width: 3,
//                               ),
//                               Text(
//                                 'Presiona Enter para guardar la tarea',
//                                 style: GoogleFonts.raleway(
//                                   fontSize: 17.5,
//                                   color: Colors.yellow[700],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           TextField(
//                             decoration: InputDecoration(
//                               icon: const Icon(Icons.title_rounded),
//                               labelText: 'Titulo',
//                               labelStyle: GoogleFonts.montserrat(),
//                             ),
//                             controller: descripcionTarea,
//                             style: GoogleFonts.montserrat(),
//                             onSubmitted: (newValue) {
//                               tituloList.add(newValue);
//                               setState(() {
//                                 descripcionTarea.text = '';
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//         label: const Text('Agregar Tarea'),
//         icon: const Icon(Icons.add),
//       ),
//     );
//   }
// }

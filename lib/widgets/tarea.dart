import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TareaListTile extends StatelessWidget {
  Color? colorTarea;
  IconButton iconCompletar;
  IconButton iconBorrar;
  Text titulo;
  Text? subtitulo;
  TareaListTile({
    Key? key,
    this.colorTarea,
    required this.iconCompletar,
    required this.iconBorrar,
    required this.titulo,
    this.subtitulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 50.0,
        left: 20.0,
        top: 8.0,
        bottom: 8.0,
      ),
      child: ListTile(
        tileColor: Colors.grey[800],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        leading: iconCompletar,
        title: titulo,
        subtitle: subtitulo,
        trailing: iconBorrar,
      ),
    );
  }
}

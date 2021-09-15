import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TareaListTile extends StatelessWidget {
  Color? colorTarea;
  IconButton iconCompletado;
  IconButton iconNoCompletado;
  IconButton iconBorrar;
  Text titulo;
  Text? subtitulo;
  bool completado;
  TareaListTile({
    Key? key,
    this.colorTarea,
    required this.iconCompletado,
    required this.iconNoCompletado,
    required this.iconBorrar,
    required this.titulo,
    this.subtitulo,
    required this.completado,
  }) : super(key: key);
  // const TareaListTile({Key? key}) : super(key: key);

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
        tileColor: colorTarea ?? Colors.grey[200],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        leading: completado == true ? iconCompletado : iconNoCompletado,
        title: titulo,
        
        subtitle: subtitulo,
        trailing: iconBorrar,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TareaListTile extends StatefulWidget {
  Color? colorTarea;
  IconButton iconBorrar;
  Text titulo;
  Text? subtitulo;
  TareaListTile({
    Key? key,
    this.colorTarea,
    required this.iconBorrar,
    required this.titulo,
    this.subtitulo,
  }) : super(key: key);

  @override
  State<TareaListTile> createState() => _TareaListTileState();
}

class _TareaListTileState extends State<TareaListTile> {
  bool? completado = false;

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
            Radius.circular(15.0),
          ),
        ),
        leading: Checkbox(
          onChanged: (value) {
            setState(() {
              completado = value;
            });
          },
          value: completado,
          splashRadius: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          side: const BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          activeColor: Colors.blue,
        ),
        title: widget.titulo,
        subtitle: widget.subtitulo,
        trailing: widget.iconBorrar,
      ),
    );
  }
}

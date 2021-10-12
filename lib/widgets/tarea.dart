import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TareaListTile extends StatefulWidget {
  Color? colorTarea;
  IconButton iconBorrar;
  // IconButton iconEditar;
  String titulo;
  String? descripcion;
  TareaListTile({
    Key? key,
    this.colorTarea,
    required this.iconBorrar,
    // required this.iconEditar,
    required this.titulo,
    this.descripcion,
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
        right: 20.0,
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
        title: Text(
          widget.titulo,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        subtitle: widget.descripcion == null
            ? null
            : Text(
                widget.descripcion.toString(),
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12.5,
                ),
              ),
        trailing: widget.iconBorrar,
        onTap: () {
          // Navigator.pushNamed(
          //   context,
          //   'detalle',
          //   arguments: DetalleArguments(widget.titulo),
          // );
          setState(() {
            if (completado == true) {
              completado = false;
            } else {
              completado = true;
            }
          });
        },
      ),
    );
  }
}

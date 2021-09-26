import 'dart:convert';

TareaModel tareaModelFromJson(String str) =>
    TareaModel.fromJson(json.decode(str));

String tareaModelToJson(TareaModel data) => json.encode(data.toJson());

class TareaModel {
  TareaModel({
    required this.id,
    required this.titulo,
    required this.completado,
  });

  int id;
  String titulo;
  bool completado;

  factory TareaModel.fromJson(Map<String, dynamic> json) => TareaModel(
        id: json["id"],
        titulo: json["titulo"],
        completado: json["completado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "completado": completado,
      };
}

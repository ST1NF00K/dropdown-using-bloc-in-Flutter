import 'dart:convert';

List<StateModel> stateModelFromJson(String str) =>
    List<StateModel>.from(json.decode(str).map((x) => StateModel.fromJson(x)));

String stateModelToJson(List<StateModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class City {
    int id;
    String nome;

    City({
        this.id,
        this.nome,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        nome: json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
    };
}
class StateModel {
  int id;
  String sigla;
  String nome;
  Region regiao;

  StateModel({
    this.id,
    this.sigla,
    this.nome,
    this.regiao,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["id"],
        sigla: json["sigla"],
        nome: json["nome"],
        regiao:
            json["regiao"] == null ? null : Region.fromJson(json["regiao"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sigla": sigla,
        "nome": nome,
        "regiao": regiao == null ? null : regiao.toJson(),
      };
}

class Region {
  final int id;
  final String sigla;
  final String nome;

  Region({this.id, this.sigla, this.nome});

    factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        sigla: json["sigla"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sigla": sigla,
        "nome": nome,
      };
}

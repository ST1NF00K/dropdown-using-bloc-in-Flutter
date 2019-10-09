import 'dart:convert';
import 'package:dropdown/state_model.dart';
import 'package:http/http.dart' show Client;

class Repository {
  Client client = new Client();
  String url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

  Future<List<StateModel>> getStates() async {
    try {
      final response = await client.get(url);

      final items = (jsonDecode(response.body) as List)
          .map((e) => StateModel.fromJson(e))
          .toList();
          return items;
    } catch (e) {
      rethrow;
    }
  }


































  Future<List<City>> getCities(int id) async {
    try{
      final response = await client.get("https://servicodados.ibge.gov.br/api/v1/localidades/estados/$id/municipios");

      final items = (jsonDecode(response.body) as List).map<City>((d) => City.fromJson(d)).toList();
      return items;
    } catch(e){
      rethrow;
    }
  }
}

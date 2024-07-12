import 'dart:convert';

import 'package:frontend_economija_mobile/database/ClienteDAO.dart';
import 'package:frontend_economija_mobile/model/categoria/DTO/DadosCategoriaDTO.dart';
import 'package:http/http.dart' as http;

class CategoriaDAO {

  static Future<List<DadosCategoriaDTO>> listarCategoriasDeReceita () async {
    final url = Uri.parse('http://192.168.56.1:8080/economizaja/categoria/receita');

    String? token = await ClienteDAO.getToken();

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => DadosCategoriaDTO.fromJson(json)).toList();

    } catch (e) {
      return Future.error(e);
      //print(e);
    }
  }

  static Future<List<DadosCategoriaDTO>> listarCategoriasDeDespesa () async {
    final url = Uri.parse('http://192.168.56.1:8080/economizaja/categoria/despesa');

    String? token = await ClienteDAO.getToken();

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => DadosCategoriaDTO.fromJson(json)).toList();

    } catch (e) {
      return Future.error(e);
      //print(e);
    }
  }
}
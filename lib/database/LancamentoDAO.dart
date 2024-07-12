import 'dart:convert';
import 'package:frontend_economija_mobile/database/ClienteDAO.dart';
import 'package:frontend_economija_mobile/model/lancamento/DTO/CadastrarLancamentoDTO.dart';
import 'package:http/http.dart' as http;

import '../model/lancamento/DTO/DadosHome.dart';

class LancamentoDAO {

  static Future<bool> cadastrar (CadastrarLancamentoDTO lancamento) async {
    final url = Uri.parse('http://192.168.56.1:8080/economizaja/lancamento/cadastrar');

    String? token = await ClienteDAO.getToken();
    print(jsonEncode(lancamento.toJson()));
    try {
      final response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(lancamento.toJson())
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<DadosHome?> dadosHome () async {
    final url = Uri.parse('http://192.168.56.1:8080/economizaja/lancamento/dadosHome');

    String? token = await ClienteDAO.getToken();

    try {
      final response = await http.get(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        /*
        print(response.body);
        print(json.decode(response.body));
        print(jsonResponse);
        */

        return DadosHome.fromJson(jsonResponse);
      }
      return null;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }


}
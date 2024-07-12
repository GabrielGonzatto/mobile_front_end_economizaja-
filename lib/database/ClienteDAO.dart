import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend_economija_mobile/model/cliente/DTO/CadastrarClienteDTO.dart';
import 'package:frontend_economija_mobile/model/cliente/DTO/EditarClienteDTO.dart';
import 'package:frontend_economija_mobile/model/cliente/DTO/LoginClienteDTO.dart';
import 'package:frontend_economija_mobile/model/cliente/DTO/DadosClienteDTO.dart';
import 'package:http/http.dart' as http;

class ClienteDAO {

    static final storage = FlutterSecureStorage();

    static Future<bool> login (LoginClienteDTO cliente) async {
        final url = Uri.parse('http://192.168.56.1:8080/economizaja/auth/login');
        try {
            final response = await http.post(
                url,
                headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(cliente.toJson())
            );

            if (response.body.isNotEmpty) {
                if (response.statusCode == 200) {
                    final data = jsonDecode(response.body);
                    setToken(data['token']);
                }

                return true;
            } else {
                return false;
            }
        } catch (e) {
            //print(e);
            return false;
        }
    }

    static Future<void> cadastrar (CadastrarClienteDTO cliente) async {
        final url = Uri.parse('http://192.168.56.1:8080/economizaja/auth/cadastrar');
        try {
            final response = await http.post(
                url,
                headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(cliente.toJson())
            );
        } catch (e) {
            //print(e);
        }
    }

    static Future<bool> editar (EditarClienteDTO cliente) async {
        final url = Uri.parse('http://192.168.56.1:8080/economizaja/auth/editar');

        String? token = await getToken();
        try {
            final response = await http.put(
                url,
                headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                    'Authorization': 'Bearer $token',
                },
                body: jsonEncode(cliente.toJson())
            );
            if (response.statusCode == 400) {
                return false;
            }
            return true;
        } catch (e) {
            print(e);
            return false;
        }
    }

    static Future<DadosClienteDTO> listarDadosCliente () async {
        final url = Uri.parse('http://192.168.56.1:8080/economizaja/auth/listarDadosCliente');

        String? token = await getToken();

        try {
            final response = await http.get(
                url,
                headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                    'Authorization': 'Bearer $token',
                },
            );

            return DadosClienteDTO.fromJson(jsonDecode(response.body));

        } catch (e) {
            return Future.error(e);
            //print(e);
        }
    }

    static Future<void> logout () async {
        await storage.delete(key: 'token');
    }

    static Future<void> setToken (String token) async{
        await storage.write(key: 'token', value: token);
    }

    static Future<String?> getToken () async{
        return await storage.read(key: 'token');
    }
}
import 'dart:ffi';

class DadosCategoriaDTO {
  late int _id = 0;
  late String _nome = '';

  DadosCategoriaDTO();

  int get id => _id;
  set id(int value) {
    _id = value;
  }

  String get nome => _nome;
  set nome(String value) {
    _nome = value;
  }

  DadosCategoriaDTO.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nome = json['nome'];
  }
}
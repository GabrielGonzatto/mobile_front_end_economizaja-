import 'dart:ffi';

import 'package:frontend_economija_mobile/model/cliente/Cliente.dart';

class Categoria {
  late Long _id;
  late String _nome;
  late String _tipo;
  late Bool _ativo;
  late Cliente _cliente;

  // Getter and Setter for id
  Long get id => _id;
  set id(Long value) {
    _id = value;
  }

  // Getter and Setter for nome
  String get nome => _nome;
  set nome(String value) {
    _nome = value;
  }

  // Getter and Setter for tipo
  String get tipo => _tipo;
  set tipo(String value) {
    _tipo = value;
  }

  // Getter and Setter for ativo
  Bool get ativo => _ativo;
  set ativo(Bool value) {
    _ativo = value;
  }

  // Getter and Setter for cliente
  Cliente get cliente => _cliente;
  set cliente(Cliente value) {
    _cliente = value;
  }
}
import 'dart:ffi';

class Cliente {
  late Long _id;
  late String _primeiro_nome;
  late String _segundo_nome;
  late String _cpf;
  late String _email;
  late String _senha;

  // Getter and Setter for id
  Long get id => _id;
  set id(Long value) {
    _id = value;
  }

  // Getter and Setter for primeiro_nome
  String get primeiro_nome => _primeiro_nome;
  set primeiro_nome(String value) {
    _primeiro_nome = value;
  }

  // Getter and Setter for segundo_nome
  String get segundo_nome => _segundo_nome;
  set segundo_nome(String value) {
    _segundo_nome = value;
  }

  // Getter and Setter for cpf
  String get cpf => _cpf;
  set cpf(String value) {
    _cpf = value;
  }

  // Getter and Setter for email
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  // Getter and Setter for senha
  String get senha => _senha;
  set senha(String value) {
    _senha = value;
  }
}

import 'dart:ffi';

import '../lancamento/Lancamento.dart';

class Parcela {
  late Long _id;
  late Double _valor;
  late Bool _paga_recebida;
  late DateTime _data;
  late Int _contador;
  late Bool _ativo;
  late Lancamento _lancamento;

  // Getter and Setter for id
  Long get id => _id;
  set id(Long value) {
    _id = value;
  }

  // Getter and Setter for valor
  Double get valor => _valor;
  set valor(Double value) {
    _valor = value;
  }

  // Getter and Setter for lancamento
  Lancamento get lancamento => _lancamento;
  set lancamento(Lancamento value) {
    _lancamento = value;
  }

  // Getter and Setter for ativo
  Bool get ativo => _ativo;
  set ativo(Bool value) {
    _ativo = value;
  }

  // Getter and Setter for contador
  Int get contador => _contador;
  set contador(Int value) {
    _contador = value;
  }

  // Getter and Setter for data
  DateTime get data => _data;
  set data(DateTime value) {
    _data = value;
  }

  // Getter and Setter for paga_recebida
  Bool get paga_recebida => _paga_recebida;
  set paga_recebida(Bool value) {
    _paga_recebida = value;
  }
}
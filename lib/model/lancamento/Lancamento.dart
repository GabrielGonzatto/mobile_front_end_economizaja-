import 'dart:ffi';

import 'package:frontend_economija_mobile/model/categoria/Categoria.dart';
import 'package:frontend_economija_mobile/model/cliente/Cliente.dart';

class Lancamento {
  late Long _id;
  late String _tipo;
  late String _descricao;
  late Double _valor;
  late DateTime _data;
  late Bool _paga_recebida;
  late Bool _fixa;
  late Bool _parcelada;
  late Int _numero_de_parcelas;
  late Bool _ativo;
  late Cliente _cliente;
  late Categoria _categoria;

  // Getter and Setter for id
  Long get id => _id;
  set id(Long value) {
    _id = value;
  }

  // Getter and Setter for tipo
  String get tipo => _tipo;
  set tipo(String value) {
    _tipo = value;
  }

  // Getter and Setter for descrição
  String get descricao => _descricao;
  set descricao(String value) {
    _descricao = value;
  }

  // Getter and Setter for valor
  Double get valor => _valor;
  set valor(Double value) {
    _valor = value;
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

  // Getter and Setter for fixa
  Bool get fixa => _fixa;
  set fixa(Bool value) {
    _fixa = value;
  }

  // Getter and Setter for parcelada
  Bool get parcelada => _parcelada;
  set parcelada(Bool value) {
    _parcelada = value;
  }

  // Getter and Setter for numero_de_parcelas
  Int get numero_de_parcelas => _numero_de_parcelas;
  set numero_de_parcelas(Int value) {
    _numero_de_parcelas = value;
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

  // Getter and Setter for categoria
  Categoria get categoria => _categoria;
  set categoria(Categoria value) {
    _categoria = value;
  }
}
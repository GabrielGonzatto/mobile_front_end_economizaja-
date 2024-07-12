import 'package:frontend_economija_mobile/model/categoria/DTO/DadosCategoriaDTO.dart';

class DadosLancamentoDTO {
  late int _id = 0;
  late String _tipo = '';
  late String _descricao = '';
  late double _valor = 0.0;
  late String _data = '';
  late bool _paga_recebida = false;
  late bool _fixa = false;
  late bool _parcelada = false;
  late int _numero_de_parcelas = 0;
  late DadosCategoriaDTO _categoria = DadosCategoriaDTO();

  DadosLancamentoDTO();


  int get id => _id;
  set id(int value) {
    _id = value;
  }

  String get tipo => _tipo;
  set tipo(String value) {
    _tipo = value;
  }

  String get descricao => _descricao;
  set descricao(String value) {
    _descricao = value;
  }

  double get valor => _valor;
  set valor(double value) {
    _valor = value;
  }

  String get data => _data;
  set data(String value) {
    _data = value;
  }

  bool get paga_recebida => _paga_recebida;
  set paga_recebida(bool value) {
    _paga_recebida = value;
  }

  DadosCategoriaDTO get categoria => _categoria;
  set categoria(DadosCategoriaDTO value) {
    _categoria = value;
  }

  int get numero_de_parcelas => _numero_de_parcelas;
  set numero_de_parcelas(int value) {
    _numero_de_parcelas = value;
  }

  bool get parcelada => _parcelada;
  set parcelada(bool value) {
    _parcelada = value;
  }

  bool get fixa => _fixa;
  set fixa(bool value) {
    _fixa = value;
  }

  DadosLancamentoDTO.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? 0;
    _tipo = json['tipo'] ?? '';
    _descricao = json['descricao'] ?? '';
    _valor = json['valor'] ?? 0.0;
    _data = json['data'] ?? '';
    _paga_recebida = json['paga_recebida'] ?? false;
    _fixa = json['fixa'] ?? false;
    _parcelada = json['parcelada'] ?? false;
    _numero_de_parcelas = json['numero_de_parcelas'] ?? 0;
    _categoria = json['categoria'] != null
        ? DadosCategoriaDTO.fromJson(json['categoria'])
        : DadosCategoriaDTO();
  }

  /*

  late DadosCategoriaDTO _categoria = DadosCategoriaDTO();*/

  /*factory DadosLancamentoDTO.fromJson(Map<String, dynamic> json) {
    return DadosLancamentoDTO()
      ..id = json['id']
      .._tipo = json['tipo']
      .._descricao = json['descricao']
      .._valor = json['valor']
      .._data = json['data']
      .._paga_recebida = json['paga_recebida']
      .._fixa = json['fixa']
      .._parcelada = json['parcelada']
      .._numero_de_parcelas = json['numero_de_parcelas']
      .._categoria = DadosCategoriaDTO.fromJson(json['categoria']);
  }*/
}
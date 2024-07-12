import 'package:frontend_economija_mobile/model/lancamento/DTO/DadosLancamentoDTO.dart';

class DadosParcelaDTO {
  late int _id = 0;
  late double _valor = 0.0;
  late bool _paga_recebida = false;
  late String _data = '';
  late int _contador = 0;
  late DadosLancamentoDTO _lancamento = DadosLancamentoDTO();

  DadosParcelaDTO();

  int get contador => _contador;
  set contador(int value) {
    _contador = value;
  }

  String get data => _data;
  set data(String value) {
    _data = value;
  }

  bool get paga_recebida => _paga_recebida;
  set paga_recebida(bool value) {
    _paga_recebida = value;
  }

  double get valor => _valor;
  set valor(double value) {
    _valor = value;
  }

  int get id => _id;
  set id(int value) {
    _id = value;
  }

  DadosLancamentoDTO get lancamento => _lancamento;
  set lancamento(DadosLancamentoDTO value) {
    _lancamento = value;
  }

  DadosParcelaDTO.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? 0;
    _valor = json['valor'] ?? 0.0;
    _data = json['data'] ?? '';
    _paga_recebida = json['paga_recebida'] ?? false;
    _contador = json['contador'] ?? 0;
    _lancamento = json['lancamento'] != null
        ? DadosLancamentoDTO.fromJson(json['lancamento'])
        : DadosLancamentoDTO();
  }
}


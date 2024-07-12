import 'package:frontend_economija_mobile/model/lancamento/DTO/DadosLancamentoDTO.dart';
import 'package:frontend_economija_mobile/model/parcela/DTO/DadosParcelaDTO.dart';

class DadosHome {
  late String _nome = '';
  late double _saldoGeral = 0.0;
  late double _receitaMensal = 0.0;
  late double _despesaMensal = 0.0;
  late List<DadosLancamentoDTO> _lancamentosDoMes = [];
  late List<DadosLancamentoDTO> _lancamentosAtrasados = [];
  late List<DadosParcelaDTO> _parcelasDoMes = [];
  late List<DadosParcelaDTO> _parcelasAtrasadas = [];

  DadosHome();

  List<DadosParcelaDTO> get parcelasAtrasadas => _parcelasAtrasadas;
  set parcelasAtrasadas(List<DadosParcelaDTO> value) {
    _parcelasAtrasadas = value;
  }

  List<DadosParcelaDTO> get parcelasDoMes => _parcelasDoMes;
  set parcelasDoMes(List<DadosParcelaDTO> value) {
    _parcelasDoMes = value;
  }

  List<DadosLancamentoDTO> get lancamentosAtrasados => _lancamentosAtrasados;
  set lancamentosAtrasados(List<DadosLancamentoDTO> value) {
    _lancamentosAtrasados = value;
  }

  List<DadosLancamentoDTO> get lancamentosDoMes => _lancamentosDoMes;
  set lancamentosDoMes(List<DadosLancamentoDTO> value) {
    _lancamentosDoMes = value;
  }

  double get despesaMensal => _despesaMensal;
  set despesaMensal(double value) {
    _despesaMensal = value;
  }

  double get receitaMensal => _receitaMensal;
  set receitaMensal(double value) {
    _receitaMensal = value;
  }

  double get saldoGeral => _saldoGeral;
  set saldoGeral(double value) {
    _saldoGeral = value;
  }

  String get nome => _nome;
  set nome(String value) {
    _nome = value;
  }

  DadosHome.fromJson(Map<String, dynamic> json) {
    _nome = json['nome'] ?? '';
    _saldoGeral = json['saldoGeral'] ?? 0.0;
    _receitaMensal = json['receitaMensal'] ?? 0.0;
    _despesaMensal = json['despesaMensal'] ?? 0.0;
    _lancamentosDoMes = (json['lancamentosDoMes'] as List<dynamic>?)
        ?.map((item) => DadosLancamentoDTO.fromJson(item as Map<String, dynamic>))
        .toList() ??
        [];
    _lancamentosAtrasados = (json['lancamentosAtrasados'] as List<dynamic>?)
        ?.map((item) => DadosLancamentoDTO.fromJson(item as Map<String, dynamic>))
        .toList() ??
        [];
    _parcelasDoMes = (json['parcelasDoMes'] as List<dynamic>?)
        ?.map((item) => DadosParcelaDTO.fromJson(item as Map<String, dynamic>))
        .toList() ??
        [];
    _parcelasAtrasadas = (json['parcelasAtrasadas'] as List<dynamic>?)
        ?.map((item) => DadosParcelaDTO.fromJson(item as Map<String, dynamic>))
        .toList() ??
        [];
  }
}
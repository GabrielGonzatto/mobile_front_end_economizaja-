import 'dart:ffi';

class CadastrarLancamentoDTO {
  late String _tipo = '';
  late String _descricao = '';
  late double _valor = 0.0;
  late String _data = '';
  late bool _paga_recebida = false;
  late bool _fixa = false;
  late bool _parcelada = false;
  late int _numero_de_parcelas = 0;
  late int _id_categoria = 0;


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
  double get valor => _valor;
  set valor(double value) {
    _valor = value;
  }

  // Getter and Setter for data
  String get data => _data;
  set data(String value) {
    _data = value;
  }

  // Getter and Setter for paga_recebida
  bool get paga_recebida => _paga_recebida;
  set paga_recebida(bool value) {
    _paga_recebida = value;
  }

  // Getter and Setter for fixa
  bool get fixa => _fixa;
  set fixa(bool value) {
    _fixa = value;
  }

  // Getter and Setter for parcelada
  bool get parcelada => _parcelada;
  set parcelada(bool value) {
    _parcelada = value;
  }

  // Getter and Setter for numero_de_parcelas
  int get numero_de_parcelas => _numero_de_parcelas;
  set numero_de_parcelas(int value) {
    _numero_de_parcelas = value;
  }

  // Getter and Setter for id_categoria
  int get id_categoria => _id_categoria;
  set id_categoria(int value) {
    _id_categoria = value;
  }

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'descricao': descricao,
      'valor': valor,
      'data': data,
      'paga_recebida': paga_recebida,
      'fixa': fixa,
      'parcelada': parcelada,
      'numero_de_parcelas': numero_de_parcelas,
      'id_categoria': id_categoria,
    };
  }
}

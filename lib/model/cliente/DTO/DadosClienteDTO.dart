class DadosClienteDTO {
  late String _primeiro_nome = '';
  late String _segundo_nome = '';
  late String _cpf = '';
  late String _email = '';

  String get primeiro_nome => _primeiro_nome;
  set primeiro_nome(String value) {
    _primeiro_nome = value;
  }

  String get segundo_nome => _segundo_nome;
  set segundo_nome(String value) {
    _segundo_nome = value;
  }

  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String get cpf => _cpf;
  set cpf(String value) {
    _cpf = value;
  }

  Map <String, dynamic> toJson () {
    return {
      'primeiro_nome': primeiro_nome,
      'segundo_nome': segundo_nome,
      'cpf': cpf,
      'email': email
    };
  }

  DadosClienteDTO.fromJson(Map<String, dynamic> json) {
    _primeiro_nome = json['primeiro_nome'] ?? '';
    _segundo_nome = json['segundo_nome'] ?? '';
    _cpf = json['cpf'] ?? '';
    _email = json['email'] ?? '';
  }
}
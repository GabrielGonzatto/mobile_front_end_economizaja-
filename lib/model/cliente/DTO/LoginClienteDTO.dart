class LoginClienteDTO {
  late String _email = '';
  late String _senha = '';

  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String get senha => _senha;
  set senha(String value) {
    _senha = value;
  }

  Map <String, dynamic> toJson () {
    return {
      'email': email,
      'senha': senha,
    };
  }
}
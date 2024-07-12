import 'package:flutter/material.dart';
import 'package:frontend_economija_mobile/model/cliente/DTO/CadastrarClienteDTO.dart';
import 'package:frontend_economija_mobile/screens/android/tela_login.dart';
import 'package:frontend_economija_mobile/service/ClienteService.dart';

class registro extends StatelessWidget {
  CadastrarClienteDTO cliente = CadastrarClienteDTO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Economiza Já'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Text(
                'Registrar-se',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Primeiro Nome',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  cliente.primeiro_nome = text;
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Segundo Nome',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  cliente.segundo_nome = text;
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  cliente.cpf = text;
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  cliente.email = text;
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  cliente.senha = text;
                },
              ),
              SizedBox(height: 20.0),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: Text(
                    'Já possui conta? clique aqui',
                    style: TextStyle(fontSize: 19.0, color: Colors.black),
                  )
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Clienteservice.cadastrar(cliente);

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => login())
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5,),
                ),
                child: Text(
                  'Registrar',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

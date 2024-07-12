import 'package:flutter/material.dart';
import 'package:frontend_economija_mobile/database/ClienteDAO.dart';
import 'package:frontend_economija_mobile/model/cliente/DTO/LoginClienteDTO.dart';
import 'package:frontend_economija_mobile/screens/android/tela_principal.dart';
import 'package:frontend_economija_mobile/screens/android/tela_registro.dart';

class login extends StatelessWidget {
  LoginClienteDTO cliente = LoginClienteDTO();

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
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                onChanged: (text) {
                  cliente.email = text;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                onChanged: (text) {
                  cliente.senha = text;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => registro()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  'Não possui conta? clique aqui',
                  style: TextStyle(fontSize: 19.0, color: Colors.black),
                )
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (await ClienteDAO.login(cliente)) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => home()),
                          (Route<dynamic> route) => false,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Email ou senha incorretos',
                            style: TextStyle(
                              fontSize: 17.0, color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          backgroundColor: Colors.red,
                        ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: Text(
                  'Entrar',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

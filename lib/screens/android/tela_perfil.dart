import 'package:flutter/material.dart';
import 'package:frontend_economija_mobile/database/ClienteDAO.dart';
import 'package:frontend_economija_mobile/model/cliente/DTO/DadosClienteDTO.dart';
import 'package:frontend_economija_mobile/model/cliente/DTO/EditarClienteDTO.dart';
import 'package:frontend_economija_mobile/screens/android/tela_login.dart';
import 'package:frontend_economija_mobile/service/ClienteService.dart';

class perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<perfil> {
  EditarClienteDTO cliente = EditarClienteDTO();
  TextEditingController primeiroNomeController = TextEditingController();
  TextEditingController segundoNomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    carregarDadosDoPerfil();
  }

  Future<void> carregarDadosDoPerfil() async {
    try {
      DadosClienteDTO dadosCliente = await Clienteservice.listarDadosCliente();
      setState(() {
        primeiroNomeController.text = dadosCliente.primeiro_nome;
        segundoNomeController.text = dadosCliente.segundo_nome;
        cpfController.text = dadosCliente.cpf;
        emailController.text = dadosCliente.email;
        senhaController.text = '';
      });

      cliente.primeiro_nome = dadosCliente.primeiro_nome;
      cliente.segundo_nome = dadosCliente.segundo_nome;
      cliente.cpf = dadosCliente.cpf;
      cliente.email = dadosCliente.email;
      cliente.senha = '';
    } catch (e) {
      print('Erro ao carregar dados do perfil: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Economiza Já'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_sharp),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => perfil()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Text(
                'Editar perfil',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: primeiroNomeController,
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
                controller: segundoNomeController,
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
                controller: cpfController,
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
                controller: emailController,
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
                controller: senhaController,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (await Clienteservice.editar(cliente)) {
                        carregarDadosDoPerfil();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Perfil editado com sucesso',
                              style: TextStyle(
                                fontSize: 17.0, color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Senha incorreta ou dados mal preenchidos',
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
                      backgroundColor: Colors.green, // Cor de fundo verde
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    ),
                    child: Text(
                      'Editar',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 20.0), // Espaçamento entre os botões
                  ElevatedButton(
                    onPressed: () {
                      ClienteDAO.logout();
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => login()),
                            (Route<dynamic> route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Cor de fundo vermelha
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

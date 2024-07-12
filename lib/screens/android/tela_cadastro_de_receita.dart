import 'package:flutter/material.dart';
import 'package:frontend_economija_mobile/model/categoria/DTO/DadosCategoriaDTO.dart';
import 'package:frontend_economija_mobile/model/lancamento/DTO/CadastrarLancamentoDTO.dart';
import 'package:frontend_economija_mobile/screens/android/tela_login.dart';
import 'package:frontend_economija_mobile/screens/android/tela_principal.dart';
import 'package:frontend_economija_mobile/service/CategoriaService.dart';
import 'package:frontend_economija_mobile/service/LancamentoService.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class cadastroReceita extends StatefulWidget {
  @override
  _TelaCadastroLancamentoState createState() => _TelaCadastroLancamentoState();
}

class _TelaCadastroLancamentoState extends State<cadastroReceita> {
  CadastrarLancamentoDTO lancamento = CadastrarLancamentoDTO();
  Future<List<DadosCategoriaDTO>>? futureCategorias;
  DadosCategoriaDTO? selectedCategoria;
  File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    futureCategorias = CategoriaService.listarCategoriasDeReceita();
  }

  Future<void> _takePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Nenhuma imagem capturada.');
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Cadastrar Receita'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_sharp),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => login()),
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
                'Cadastrar receita',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  lancamento.descricao = text;
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Valor',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  lancamento.valor = double.parse(text);
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Data (YYYY-MM-DD)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  lancamento.data = text;
                },
              ),
              SizedBox(height: 20.0),
              // FutureBuilder para listar categorias
              FutureBuilder<List<DadosCategoriaDTO>>(
                future: futureCategorias,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro ao carregar categorias: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Nenhuma categoria disponível'));
                  } else {
                    return DropdownButtonFormField<DadosCategoriaDTO>(
                      decoration: InputDecoration(
                        labelText: 'Selecione uma Categoria',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedCategoria,
                      items: snapshot.data!.map((DadosCategoriaDTO categoria) {
                        return DropdownMenuItem<DadosCategoriaDTO>(
                          value: categoria,
                          child: Text(categoria.nome),
                        );
                      }).toList(),
                      onChanged: (DadosCategoriaDTO? newValue) {
                        setState(() {
                          selectedCategoria = newValue;
                          lancamento.id_categoria = selectedCategoria!.id;
                        });
                      },
                    );
                  }
                },
              ),
              SizedBox(height: 20.0),
              SwitchListTile(
                title: Text('Receita recebida'),
                value: lancamento.paga_recebida,
                onChanged: (value) {
                  setState(() {
                    lancamento.paga_recebida = value;
                  });
                },
              ),
              SizedBox(height: 10.0),
              SwitchListTile(
                title: Text('Receita fixa mensal'),
                value: lancamento.fixa,
                onChanged: (value) {
                  setState(() {
                    lancamento.fixa = value;
                    if (value == true) {
                      lancamento.parcelada = false;
                    }
                  });
                },
              ),
              SizedBox(height: 10.0),
              SwitchListTile(
                title: Text('Receita parcelada'),
                value: lancamento.parcelada,
                onChanged: (value) {
                  setState(() {
                    lancamento.parcelada = value;
                    if (value == true) {
                      lancamento.fixa = false;
                    }
                  });
                },
              ),
              SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Número de parcelas',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  lancamento.numero_de_parcelas = int.parse(text);
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _takePicture,
                child: Text('Tirar Foto'),
              ),
              SizedBox(height: 20.0),
              _image == null
                  ? Text('Nenhuma imagem capturada.')
                  : Image.file(_image!),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (LancamentoService.cadastrarReceita(lancamento)) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => home()),
                              (Route<dynamic> route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Preencha todos os campos corretamente',
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
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    ),
                    child: Text(
                      'Cadastrar',
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

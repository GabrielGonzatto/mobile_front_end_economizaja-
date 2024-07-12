import 'package:flutter/material.dart';
import 'package:frontend_economija_mobile/model/lancamento/DTO/DadosLancamentoDTO.dart';
import 'package:frontend_economija_mobile/model/parcela/DTO/DadosParcelaDTO.dart';
import 'package:frontend_economija_mobile/screens/android/tela_perfil.dart';

class detalhesParcela extends StatelessWidget {
  final DadosParcelaDTO parcela;

  detalhesParcela(this.parcela);

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
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => perfil()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.green,
      body: Container(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 200.0),
        child: Center(
          child: Container(
            color: Colors.white, // Cor de fundo para a Column
            padding: EdgeInsets.only(top: 16.0, bottom: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('Descrição: ${parcela.lancamento.descricao}'),
                ),
                ListTile(
                  title: Text('Data: ${parcela.lancamento.data}'),
                ),
                ListTile(
                  title: Text('Valor: ${parcela.lancamento.valor.toStringAsFixed(2)}'),
                ),
                ListTile(
                  title: Text('Pago/Recebido: ${parcela.lancamento.paga_recebida ? 'Sim' : 'Não'}'),
                ),
                ListTile(
                  title: Text('Parcelada: ${parcela.lancamento.parcelada ? 'Sim' : 'Não'}'),
                ),
                ListTile(
                  title: Text('Numero de parcelas: ${parcela.lancamento.numero_de_parcelas}'),
                ),
                ListTile(
                  title: Text('Valor de cada parcela: ${parcela.valor}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

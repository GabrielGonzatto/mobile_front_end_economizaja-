import 'package:flutter/material.dart';
import 'package:frontend_economija_mobile/model/lancamento/DTO/DadosHome.dart';
import 'package:frontend_economija_mobile/model/lancamento/DTO/DadosLancamentoDTO.dart';
import 'package:frontend_economija_mobile/model/parcela/DTO/DadosParcelaDTO.dart';
import 'package:frontend_economija_mobile/screens/android/tela_detalhes_lancamento.dart';
import 'package:frontend_economija_mobile/screens/android/tela_detalhes_parcela.dart';
import 'package:frontend_economija_mobile/service/LancamentoService.dart';
import 'package:frontend_economija_mobile/screens/android/tela_cadastro_de_despesa.dart';
import 'package:frontend_economija_mobile/screens/android/tela_cadastro_de_receita.dart';
import 'package:frontend_economija_mobile/screens/android/tela_perfil.dart';

class home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<home> {
  Future<DadosHome?>? dadosHome;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dadosHome = LancamentoService.dadosHome();
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
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => perfil()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.green,
      body: FutureBuilder<DadosHome?>(
        future: dadosHome,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('Nenhum dado disponível'));
          } else {
            final dados = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black, // Cor da borda
                          width: 2.0, // Largura da borda
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Seu saldo é de: ${dados.saldoGeral}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                    color: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black, // Cor da borda
                          width: 2.0, // Largura da borda
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Acesso Rápido',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_upward, size: 40.0, color: Colors.green),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => cadastroReceita()),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_downward, size: 40.0, color: Colors.red),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => cadastroDespesa()),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.align_vertical_bottom, size: 40.0, color: Colors.blue),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => perfil()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Cor da borda
                            width: 2.0, // Largura da borda
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildSectionTitle(context, 'Lançamentos Atrasados'),
                              buildListLancamentos(dados.lancamentosAtrasados),

                              buildSectionTitle(context, 'Parcelas Atrasadas'),
                              buildListParcelas(dados.parcelasAtrasadas),

                              buildSectionTitle(context, 'Lançamentos do Mês'),
                              buildListLancamentos(dados.lancamentosDoMes),

                              buildSectionTitle(context, 'Parcelas do Mês'),
                              buildListParcelas(dados.parcelasDoMes),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildListLancamentos(List<DadosLancamentoDTO> items) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => detalheslancamento(item),
            ),
            );
          },

          title: Text(item.descricao),
          subtitle: Text('Data: ${item.data}                        Valor ${item.valor}'),
        );
      },
    );
  }

  Widget buildListParcelas(List<DadosParcelaDTO> items) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => detalhesParcela(item),
            ),
            );
          },

          title: Text(item.lancamento.descricao),
          subtitle: Text('Data: ${item.data}                        Valor ${item.valor}'),
        );

      },
    );
  }
}

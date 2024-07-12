import 'package:frontend_economija_mobile/database/LancamentoDAO.dart';
import 'package:frontend_economija_mobile/model/lancamento/DTO/CadastrarLancamentoDTO.dart';

import '../model/lancamento/DTO/DadosHome.dart';

class LancamentoService {

  static Future<DadosHome?> dadosHome () async{
    return LancamentoDAO.dadosHome();
  }

  static bool cadastrarReceita (CadastrarLancamentoDTO lancamento) {
    if (lancamento.descricao == '' || lancamento.data == '' || lancamento.valor == 0.0) {
      return false;
    }
    lancamento.tipo = 'receita';
    LancamentoDAO.cadastrar(lancamento);
    return true;
  }

  static bool cadastrarDespesa (CadastrarLancamentoDTO lancamento) {
    if (lancamento.descricao == '' || lancamento.data == '' || lancamento.valor == 0.0) {
      return false;
    }
    lancamento.tipo = 'despesa';
    LancamentoDAO.cadastrar(lancamento);
    return true;
  }
}
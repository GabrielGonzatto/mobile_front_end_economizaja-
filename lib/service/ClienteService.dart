import 'package:frontend_economija_mobile/database/ClienteDAO.dart';
import 'package:frontend_economija_mobile/model/cliente/DTO/CadastrarClienteDTO.dart';
import 'package:frontend_economija_mobile/model/cliente/DTO/DadosClienteDTO.dart';
import 'package:frontend_economija_mobile/model/cliente/DTO/EditarClienteDTO.dart';

class Clienteservice {
  static void cadastrar (CadastrarClienteDTO cliente) {
    ClienteDAO.cadastrar(cliente);
  }

  static Future<bool> editar (EditarClienteDTO cliente) async {
    if (cliente.primeiro_nome == '' || cliente.segundo_nome == '' || cliente.cpf == '' || cliente.email == '' || cliente.senha == '') {
      return false;
    }
    return await ClienteDAO.editar(cliente);
  }

  static Future<DadosClienteDTO> listarDadosCliente () {
    return ClienteDAO.listarDadosCliente();
  }


}
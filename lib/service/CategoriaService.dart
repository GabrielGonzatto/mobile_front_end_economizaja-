import 'package:frontend_economija_mobile/database/CategoriaDAO.dart';
import 'package:frontend_economija_mobile/model/categoria/DTO/DadosCategoriaDTO.dart';

class CategoriaService {
  static Future<List<DadosCategoriaDTO>> listarCategoriasDeReceita () {
    return CategoriaDAO.listarCategoriasDeReceita();
  }

  static Future<List<DadosCategoriaDTO>> listarCategoriasDeDespesa () {
    return CategoriaDAO.listarCategoriasDeDespesa();
  }
}
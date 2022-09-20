import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/produto.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_produto.dart';

class MapperProduto implements IMapperProduto {
  @override
  Map<String, dynamic> toMap(Produto produto) {
    return {
      'id': produto.id.toInt(),
      'descricao': produto.descricao,
      'valor': produto.valor.toDouble(),
      'ingredientes': produto.ingredientes,
      'disponivel': produto.disponivel,
      'fornecedorId': produto.fornecedor.id.toInt(),
    };
  }

  @override
  Produto fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'].toInt(),
      descricao: map['descricao'],
      valor: map['valor'].toDouble(),
      ingredientes: map['ingredientes'],
      disponivel: map['disponivel'],
      fornecedor: Fornecedor(
        id: map['fornecedorId'].toInt(),
      ),
    );
  }
}

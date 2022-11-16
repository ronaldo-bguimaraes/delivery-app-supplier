import 'package:delivery_app_supplier/dto/item_produto.dart';
import 'package:delivery_app_supplier/dto/produto.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_item_produto.dart';

class MapperItemProduto implements IMapperItemProduto {
  @override
  Map<String, dynamic> toMap(ItemProduto itemProduto) {
    return {
      'id': itemProduto.id.toInt(),
      'valor': itemProduto.valor.toDouble(),
      'quantidade': itemProduto.quantidade.toInt(),
      'produtoId': itemProduto.produto.id.toInt(),
    };
  }

  @override
  ItemProduto fromMap(Map<String, dynamic> map) {
    return ItemProduto(
      id: map['id'].toInt(),
      valor: map['valor'].toDouble(),
      quantidade: map['quantidade'].toInt(),
      produto: Produto(
        id: map['produtoId']?.toInt() ?? 0,
      ),
    );
  }
}

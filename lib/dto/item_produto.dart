import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';
import 'package:delivery_app_supplier/dto/produto.dart';

class ItemProduto extends IEntity {
  @override
  int id;
  double valor;
  int quantidade;
  Produto produto;

  ItemProduto({
    this.id = 0,
    this.valor = 0,
    this.quantidade = 0,
    Produto? produto,
  }) : produto = produto ?? Produto();

  factory ItemProduto.fromProduto(Produto produto) {
    return ItemProduto(
      valor: produto.valor,
      quantidade: 1,
      produto: produto,
    );
  }

  Produto toProduto() {
    return Produto(
      id: produto.id,
      descricao: produto.descricao,
      disponivel: valor == produto.valor,
      fornecedor: produto.fornecedor,
      ingredientes: produto.ingredientes,
      valor: valor,
    );
  }
}

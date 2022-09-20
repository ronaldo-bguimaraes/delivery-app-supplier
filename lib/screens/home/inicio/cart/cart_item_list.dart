import 'package:delivery_app_supplier/dto/item_produto.dart';
import 'package:flutter/material.dart';

class CartItemList {
  final String descricao;
  final double valor;
  int quantidade;
  final String fornecedor;
  final String ingredientes;
  final bool disponivel;
  final String categoria;
  final ImageProvider<Object> image;
  final void Function(BuildContext) event;

  CartItemList({
    required this.descricao,
    required this.valor,
    this.quantidade = 1,
    required this.fornecedor,
    required this.ingredientes,
    required this.disponivel,
    required this.categoria,
    required this.image,
    required this.event,
  });

  factory CartItemList.fromItemProduto(ItemProduto itemProduto) {
    return CartItemList(
      descricao: itemProduto.produto.descricao,
      valor: itemProduto.valor,
      quantidade: itemProduto.quantidade,
      fornecedor: itemProduto.produto.fornecedor.razaoSocial,
      ingredientes: itemProduto.produto.ingredientes,
      disponivel: itemProduto.produto.disponivel,
      categoria: '',
      image: const AssetImage('./assets/images/produto.png'),
      event: (ctx) {
        //
      },
    );
  }
}

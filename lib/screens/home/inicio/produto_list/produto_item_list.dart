import 'package:delivery_app_supplier/dto/item_produto.dart';
import 'package:delivery_app_supplier/dto/produto.dart';
import 'package:delivery_app_supplier/screens/home/inicio/cart/cart_screen.dart';
import 'package:delivery_app_supplier/service/interface/i_service_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdutoItemList {
  final String descricao;
  final double valor;
  final String fornecedor;
  final String ingredientes;
  final bool disponivel;
  final String categoria;
  final ImageProvider<Object> image;
  final void Function(BuildContext) event;

  const ProdutoItemList({
    required this.descricao,
    required this.valor,
    required this.fornecedor,
    required this.ingredientes,
    required this.disponivel,
    required this.categoria,
    required this.image,
    required this.event,
  });

  factory ProdutoItemList.fromProduto(Produto produto) {
    return ProdutoItemList(
      descricao: produto.descricao,
      valor: produto.valor,
      fornecedor: produto.fornecedor.razaoSocial,
      ingredientes: produto.ingredientes,
      disponivel: produto.disponivel,
      categoria: '',
      image: const AssetImage('./assets/images/produto.png'),
      event: (ctx) {
        //
      },
    );
  }
}

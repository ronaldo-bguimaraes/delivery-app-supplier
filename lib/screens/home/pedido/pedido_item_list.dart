import 'package:delivery_app_supplier/dto/item_produto.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/dto/venda.dart';
import 'package:flutter/material.dart';

class PedidoItemList {
  final DateTime dataVenda;
  final List<ItemProduto> itensProduto;
  final Usuario usuario;
  final void Function(BuildContext) event;

  const PedidoItemList({
    required this.dataVenda,
    required this.itensProduto,
    required this.usuario,
    required this.event,
  });

  factory PedidoItemList.fromVenda(Venda venda) {
    return PedidoItemList(
      dataVenda: venda.dataVenda,
      itensProduto: venda.itensProduto,
      usuario: venda.cliente.usuario,
      event: (ctx) {
        //
      },
    );
  }
}

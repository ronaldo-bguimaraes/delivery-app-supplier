import 'package:delivery_app_supplier/dto/item_produto.dart';
import 'package:delivery_app_supplier/service/interface/i_service_cart.dart';
import 'package:flutter/material.dart';

class ServiceCart extends ChangeNotifier implements IServiceCart {
  @override
  final List<ItemProduto> itensProduto = [];

  @override
  void add(ItemProduto itemProduto) {
    try {
      itensProduto.firstWhere((e) => e.produto.id == itemProduto.produto.id).quantidade += 1;
    }
    //
    catch (e) {
      itensProduto.add(itemProduto);
    }
    notifyListeners();
  }

  @override
  void delete(ItemProduto itemProduto) {
    itensProduto.remove(itemProduto);
    notifyListeners();
  }

  @override
  double totalCart() {
    double vlrTotal = 0;
    for (var itemProduto in itensProduto) {
      vlrTotal += itemProduto.valor * itemProduto.quantidade;
    }
    return vlrTotal;
  }

  @override
  void remove(ItemProduto itemProduto) {
    var item = itensProduto.firstWhere((e) => e.produto.id == itemProduto.produto.id);
    if (item.quantidade > 1) {
      item.quantidade -= 1;
    }
    notifyListeners();
  }
}

import 'package:delivery_app_supplier/screens/home/inicio/cart/cart_button.dart';
import 'package:delivery_app_supplier/screens/home/inicio/fornecedor_list/fornecedor_list.dart';
import 'package:delivery_app_supplier/screens/home/inicio/fornecedor_list/fornecedor_item_list.dart';
import 'package:delivery_app_supplier/screens/home/inicio/produto_list/produto_item_list.dart';
import 'package:delivery_app_supplier/screens/home/inicio/produto_list/produto_list.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final List<String> _categorias = ['Fornecedores', 'Produtos'];

  final List<FornecedorItemList> _todos = [
    FornecedorItemList(
      title: 'CJ Lanches',
      categoria: 'Lanches',
      distancia: 5.5,
      tempoEntrega: 10,
      frete: 10,
      image: const AssetImage('./assets/images/user.png'),
      event: (context) {
        //
      },
    ),
    FornecedorItemList(
      title: 'Faveri Carnes e Cia',
      categoria: 'Carnes',
      distancia: 7.2,
      tempoEntrega: 20,
      frete: 0,
      image: const AssetImage('./assets/images/user.png'),
      event: (context) {
        //
      },
    ),
  ];

  final List<ProdutoItemList> _myList = [
    ProdutoItemList(
      descricao: 'Baguncinha',
      valor: 15,
      categoria: 'Lanches',
      fornecedor: 'Bellatos',
      ingredientes: 'Pão, hamburguer, alface, tomate, ovo, milho, salsicha',
      disponivel: true,
      image: const AssetImage('./assets/images/baguncinha.png'),
      event: (context) {
        //
      },
    ),
    ProdutoItemList(
      descricao: 'X-Tudo',
      valor: 25,
      categoria: 'Lanches',
      fornecedor: 'CJ Lanches',
      ingredientes: 'Pão, hamburguer, alface, tomate, ovo, milho, salsicha, bacon, cheddar',
      disponivel: true,
      image: const AssetImage('./assets/images/x-tudo.png'),
      event: (context) {
        //
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Inicio'),
          bottom: TabBar(
            tabs: _categorias.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            FornecedorList(list: _todos),
            ProdutoList(list: _myList),
          ],
        ),
      ),
      length: _categorias.length,
    );
  }
}

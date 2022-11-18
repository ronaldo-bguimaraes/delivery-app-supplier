import 'package:delivery_app_supplier/screens/home/inicio/produto_list/produto_list.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final List<String> _categorias = ['Meus Produtos'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Inicio"),
          bottom: TabBar(
            tabs: _categorias.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: const TabBarView(
          children: [
            ProdutoList(),
          ],
        ),
      ),
      length: _categorias.length,
    );
  }
}

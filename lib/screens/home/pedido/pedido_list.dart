import 'package:delivery_app_supplier/screens/home/inicio/cart/cart_button.dart';
import 'package:flutter/material.dart';

class PedidoList extends StatefulWidget {
  static const String routeName = '/pedido-list';

  const PedidoList({Key? key}) : super(key: key);

  @override
  State<PedidoList> createState() => _PedidoListState();
}

class _PedidoListState extends State<PedidoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CartButton(),
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      body: Container(),
    );
  }
}

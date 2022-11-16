import 'package:flutter/material.dart';

class PedidoList extends StatefulWidget {
  static const String routeName = '/pedido-list';

  const PedidoList({Key? key}) : super(key: key);

  @override
  State<PedidoList> createState() => _PedidoListState();
}

class _PedidoListState extends State<PedidoList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('click'),
        ),
      ),
    );
  }
}

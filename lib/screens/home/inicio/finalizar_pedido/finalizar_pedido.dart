import 'package:delivery_app_supplier/dto/venda.dart';
import 'package:delivery_app_supplier/screens/home/inicio/finalizar_pedido/finalizar_pedido_item_list.dart';
import 'package:delivery_app_supplier/service/interface/i_service_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinalizarPedido extends StatefulWidget {
  static const String routeName = '/finalizar-pedido';
  const FinalizarPedido({Key? key}) : super(key: key);

  @override
  State<FinalizarPedido> createState() => _FinalizarPedidoState();
}

class _FinalizarPedidoState extends State<FinalizarPedido> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IServiceCart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Meus pedidos'),
        ),
        body: Consumer<IServiceCart>(
          builder: (context, cart, child) {
            final FinalizarPedidoItem item = FinalizarPedidoItem(
              title: 'CJ Lanches',
              image: const AssetImage('./assets/images/user.png'),
              event: (context) {
                //
              },
            );
            return Column(
              children: [
                GestureDetector(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 0,
                            child: CircleAvatar(
                              backgroundImage: item.image,
                              radius: 20,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    item.event(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        "Resumo de valores",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text("SubTotal"),
                          Text("R\$ ${cart.totalCart().toStringAsFixed(2)}"),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text("Taxa de entrega"),
                          Text("R\$ ${(cart.totalCart() * 0.1).toStringAsFixed(2)}"),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "R\$ ${cart.totalCart().toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Selecione o endereço de entrega",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 0,
                                  child: Icon(Icons.location_pin),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Rua Cel L Figueredo",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Jardim tropical",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ),
                                const Expanded(
                                  flex: 0,
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          item.event(context);
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Selecione a forma de pagamento",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 0,
                                  child: Icon(Icons.payment),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Crédito pelo App",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Master Card **** 3140",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ),
                                const Expanded(
                                  flex: 0,
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          item.event(context);
                        },
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //
                  final venda = Venda.fromItensProduto(cart.itensProduto);
                  print(venda);
                },
                child: Text("Finalizar Pedido (R\$ ${cart.totalCart().toStringAsFixed(2)})"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

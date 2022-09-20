import 'package:delivery_app_supplier/screens/home/inicio/cart/cart_item_list.dart';
import 'package:delivery_app_supplier/service/interface/i_service_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyCart extends StatefulWidget {
  const BodyCart({Key? key}) : super(key: key);

  @override
  State<BodyCart> createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IServiceCart>(builder: (context, cart, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final itemProduto = cart.itensProduto[index];
            final cartItemList = CartItemList.fromItemProduto(itemProduto);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItemList.descricao,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cartItemList.fornecedor,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(cartItemList.ingredientes),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Preço: R\$" + cartItemList.valor.toStringAsFixed(2)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("SubTotal: R\$" + (cartItemList.valor * cartItemList.quantidade).toStringAsFixed(2))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: Image(image: cartItemList.image),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cart.delete(itemProduto);
                          });
                        },
                        child: const Text("Remover"),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            cart.remove(itemProduto);
                          });
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        cartItemList.quantidade.toString(),
                      ),
                      IconButton(
                        color: Colors.green[800],
                        onPressed: () {
                          setState(() {
                            cart.add(itemProduto);
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: cart.itensProduto.length,
        ),
      );
    });
  }
}

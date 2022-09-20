import 'package:delivery_app_supplier/screens/home/inicio/cart/cart_screen.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(CartScreen.routeName);
      },
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}

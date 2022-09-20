import 'package:delivery_app_supplier/screens/home/inicio/inicio.dart';
import 'package:delivery_app_supplier/screens/home/pedido/pedido_list.dart';
import 'package:delivery_app_supplier/screens/perfil/perfil.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: const [
          Inicio(),
          PedidoList(),
          Perfil(),
        ],
        index: _selectedPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Pedidos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
        currentIndex: _selectedPage,
        onTap: _onTapped,
      ),
    );
  }

  _onTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}

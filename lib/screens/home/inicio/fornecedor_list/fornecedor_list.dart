import 'package:delivery_app_supplier/screens/home/inicio/fornecedor_list/fornecedor_item_list.dart';
import 'package:flutter/material.dart';

class FornecedorList extends StatelessWidget {
  final List<FornecedorItemList> list;

  const FornecedorList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          var item = list[index];
          return GestureDetector(
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
                          Text(
                            '${item.categoria} - ${item.distancia} KM',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${item.tempoEntrega} - ${item.tempoEntrega + 10} min (${item.frete > 0 ? 'R\$ ${item.frete.toStringAsFixed(2)}' : 'Grátis'})',
                            style: const TextStyle(
                              fontSize: 12,
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
                        Icons.arrow_forward,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              item.event(context);
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: Colors.black26,
          );
        },
        itemCount: list.length,
      ),
    );
  }
}

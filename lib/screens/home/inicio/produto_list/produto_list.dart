import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/produto.dart';
import 'package:delivery_app_supplier/dto/venda.dart';
import 'package:delivery_app_supplier/screens/builder/future_snapshot_builder.dart';
import 'package:delivery_app_supplier/screens/helper/get_cliente.dart';
import 'package:delivery_app_supplier/screens/home/inicio/produto_list/produto_item_list.dart';
import 'package:delivery_app_supplier/service/interface/i_service_produto_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdutoList extends StatefulWidget {
  const ProdutoList({Key? key}) : super(key: key);

  @override
  State<ProdutoList> createState() => _ProdutoListState();
}

class _ProdutoListState extends State<ProdutoList> {
  Future<List<Produto>> getProdutoList() async {
    Fornecedor fornecedor = await getCurrentFornecedor(context);
    return await context.read<IServiceProdutoAuth>().getByFornecedor(fornecedor);
  }

  @override
  Widget build(BuildContext ctx) {
    return FutureSnapshotBuilder<List<Produto>>(
      future: getProdutoList(),
      showChild: (produtos) {
        return produtos != null && produtos.isNotEmpty;
      },
      builder: (ctx, produtos) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final product = produtos[index];
            final productItemList = ProdutoItemList.fromProduto(product);
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productItemList.descricao,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            productItemList.fornecedor,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(productItemList.ingredientes),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Preço: R\$" + productItemList.valor.toStringAsFixed(2))
                        ],
                      ),
                    ),
                    Image(
                      image: productItemList.image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
              onTap: () {
                productItemList.event(context);
              },
              behavior: HitTestBehavior.opaque,
            );
          },
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Divider(),
            );
          },
          itemCount: produtos.length,
        );
      },
    );
  }
}

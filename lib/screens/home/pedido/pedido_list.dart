import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/item_produto.dart';
import 'package:delivery_app_supplier/dto/venda.dart';
import 'package:delivery_app_supplier/enums/condicao_venda.dart';
import 'package:delivery_app_supplier/screens/builder/future_snapshot_builder.dart';
import 'package:delivery_app_supplier/screens/helper/get_cliente.dart';
import 'package:delivery_app_supplier/screens/helper/status.dart';
import 'package:delivery_app_supplier/screens/home/pedido/pedido_item_list.dart';
import 'package:delivery_app_supplier/service/interface/i_service_venda_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PedidoList extends StatefulWidget {
  static const String routeName = '/pedido-list';

  const PedidoList({Key? key}) : super(key: key);

  @override
  State<PedidoList> createState() => _PedidoListState();
}

class _PedidoListState extends State<PedidoList> {
  Future<List<Venda>> getVendaList() async {
    Fornecedor fornecedor = await getCurrentFornecedor(context);
    List<Venda> vendas = await context.read<IServiceVendaAuth>().getByFornecedor(fornecedor);
    //
    await context.read<IServiceVendaAuth>().includeProdutos(vendas);
    await context.read<IServiceVendaAuth>().includeClienteAndUsuario(vendas);
    //
    return vendas;
  }

  final _dateFormat = DateFormat('dd/MM/yyyy');
  final _timeFormat = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Vendas'),
      ),
      body: FutureSnapshotBuilder<List<Venda>>(
        future: getVendaList(),
        showChild: (vendas) {
          return vendas != null && vendas.isNotEmpty;
        },
        builder: (ctx, pedidos) {
          pedidos.sort((a, b) => b.dataVenda.compareTo(a.dataVenda));
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final pedido = pedidos[index];
              final pedidoItemList = PedidoItemList.fromVenda(pedido);
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID Pedido: ${pedido.id}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Solicitado em ${_dateFormat.format(pedidoItemList.dataVenda)} às ${_timeFormat.format(pedidoItemList.dataVenda)}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Cliente: ${pedidoItemList.usuario.nome}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const Divider(),
                            ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                ItemProduto itemProduto = pedidoItemList.itensProduto[index];
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(itemProduto.produto.descricao),
                                        Text(
                                          '${itemProduto.quantidade.toString()} x R\$ ${itemProduto.valor.toStringAsFixed(2)} = R\$ ${(itemProduto.valor * itemProduto.quantidade).toStringAsFixed(2)}',
                                        ),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: pedidoItemList.itensProduto.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                            const Divider(),
                            Row(
                              children: [
                                const Text('Valor total:'),
                                Text('R\$ ${pedido.total.toStringAsFixed(2)}'),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Status do venda: ${getStatusPedido(pedido.condicao)}'),
                            const SizedBox(
                              height: 10,
                            ),
                            if (pedido.condicao == CondicaoVenda.solicitada)
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        print(pedido.cliente.usuario.nome);
                                      },
                                      child: const Text("Cancelar"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Aceitar"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  pedidoItemList.event(context);
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
            itemCount: pedidos.length,
          );
        },
      ),
    );
  }
}

import 'package:delivery_app_supplier/dto/cliente.dart';
import 'package:delivery_app_supplier/dto/endereco.dart';
import 'package:delivery_app_supplier/dto/entregador.dart';
import 'package:delivery_app_supplier/dto/item_produto.dart';
import 'package:delivery_app_supplier/dto/pagamento.dart';
import 'package:delivery_app_supplier/dto/venda.dart';
import 'package:delivery_app_supplier/enums/condicao_venda.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_item_produto.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_venda.dart';

class MapperVenda implements IMapperVenda {
  IMapperItemProduto mapperItemProduto;

  MapperVenda(this.mapperItemProduto);

  @override
  Map<String, dynamic> toMap(Venda venda) {
    return {
      'id': venda.id.toInt(),
      'subtotal': venda.subtotal.toDouble(),
      'frete': venda.frete.toDouble(),
      'total': venda.total.toDouble(),
      'dataVenda': venda.dataVenda.toUtc().toIso8601String(),
      'desconto': venda.desconto.toDouble(),
      'condicao': venda.condicao.value,
      'itensProduto': venda.itensProduto.map(mapperItemProduto.toMap).toList(),
      'clienteId': venda.cliente.id.toInt(),
      'entregadorId': venda.entregador?.id.toInt(),
      'pagamentoId': venda.pagamento?.id.toInt(),
      'enderecoId': venda.pagamento?.id.toInt()
    };
  }

  @override
  Venda fromMap(Map<String, dynamic> map) {
    return Venda(
      id: map['id'].toInt(),
      subtotal: map['subtotal'].toDouble(),
      frete: map['frete'].toDouble(),
      total: map['total'].toDouble(),
      dataVenda: DateTime.parse(map['dataVenda']).add(DateTime.now().timeZoneOffset),
      desconto: map['desconto'].toDouble(),
      condicao: CondicaoVenda.getByValue(map['condicao'].toInt()),
      itensProduto: List<ItemProduto>.from(map['itensProduto'].map((e) => mapperItemProduto.fromMap(e))),
      cliente: Cliente(
        id: map['clienteId']?.toInt() ?? 0,
      ),
      entregador: Entregador(
        id: map['entregadorId']?.toInt() ?? 0,
      ),
      pagamento: Pagamento(
        id: map['pagamentoId']?.toInt() ?? 0,
      ),
      endereco: Endereco(
        id: map['pagamentoId']?.toInt() ?? 0,
      ),
    );
  }
}

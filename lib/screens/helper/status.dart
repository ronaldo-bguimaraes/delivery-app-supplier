import 'package:delivery_app_supplier/enums/condicao_venda.dart';

String? getStatusPedido(CondicaoVenda condicaoVenda) {
  final map = {
    CondicaoVenda.solicitada: 'solicitada',
    CondicaoVenda.confirmada: 'confirmada',
    CondicaoVenda.finalizada: 'finalizada',
    CondicaoVenda.cancelada: 'cancelada',
  };
  if (map.containsKey(condicaoVenda)) {
    return map[condicaoVenda];
  }
  return 'indefinido';
}

import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';
import 'package:delivery_app_supplier/enums/forma_pagamento.dart';

class Pagamento extends IEntity {
  @override
  int id;
  double valor;
  DateTime dataPagamento;
  FormaPagamento formaPagamento;

  Pagamento({
    this.id = 0,
    this.valor = 0,
    DateTime? dataPagamento,
    this.formaPagamento = FormaPagamento.dinheiro,
  }) : dataPagamento = dataPagamento ?? DateTime.now();
}

import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';

class Produto extends IEntity {
  @override
  int id;
  String descricao;
  double valor;
  String ingredientes;
  bool disponivel;
  Fornecedor fornecedor;

  Produto({
    this.id = 0,
    this.descricao = '',
    this.valor = 0,
    this.ingredientes = '',
    this.disponivel = false,
    Fornecedor? fornecedor,
  }) : fornecedor = fornecedor ?? Fornecedor();
}

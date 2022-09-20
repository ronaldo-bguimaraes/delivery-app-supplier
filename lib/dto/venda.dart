import 'package:delivery_app_supplier/dto/cliente.dart';
import 'package:delivery_app_supplier/dto/entregador.dart';
import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';
import 'package:delivery_app_supplier/dto/item_produto.dart';
import 'package:delivery_app_supplier/dto/pagamento.dart';
import 'package:delivery_app_supplier/enums/condicao_venda.dart';

class Venda extends IEntity {
  @override
  int id;
  double subTotal;
  double frete;
  double total;
  DateTime dataVenda;
  double desconto;
  double valor;
  CondicaoVenda condicao;
  List<ItemProduto> itensProduto;
  Cliente cliente;
  Entregador entregador;
  Pagamento pagamento;

  Venda({
    this.id = 0,
    this.subTotal = 0,
    this.frete = 0,
    this.total = 0,
    DateTime? dataVenda,
    this.desconto = 0,
    this.valor = 0,
    this.condicao = CondicaoVenda.solicitada,
    List<ItemProduto>? itensProduto,
    Cliente? cliente,
    Entregador? entregador,
    Pagamento? pagamento,
  })  : dataVenda = dataVenda ?? DateTime.now(),
        itensProduto = [],
        cliente = Cliente(),
        entregador = Entregador(),
        pagamento = Pagamento();

  factory Venda.fromItensProduto(List<ItemProduto> itensProduto) {
    return Venda(
      itensProduto: itensProduto,
    );
  }
}

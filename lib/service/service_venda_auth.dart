import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/produto.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/dto/venda.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_venda_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_produto_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_venda_auth.dart';
import 'package:delivery_app_supplier/service/service_entity_auth.dart';

class ServiceVendaAuth<T extends Venda, U extends Usuario, V extends Fornecedor, W extends Produto> extends ServiceEntityAuth<T, U> implements IServiceVendaAuth<T, U, V> {
  IRepositoryVendaAuth<T, U, V> repositoryVenda;

  IServiceProdutoAuth<W, U, V> serviceProduto;

  ServiceVendaAuth(this.repositoryVenda, this.serviceProduto) : super(repositoryVenda);

  @override
  Future<List<T>> getByFornecedor(V fornecedor) async {
    return await repositoryVenda.getByFornecedor(fornecedor);
  }

  @override
  Future<List<T>> includeProdutos(List<T> vendas) async {
    final awaitList = vendas.map((e) async {
      final awaitList = e.itensProduto.map((e) async {
        final produto = await serviceProduto.get(e.produto.id);
        if (produto != null) {
          e.produto = produto;
        }
        return e;
      });
      e.itensProduto = await Future.wait(awaitList);
      return e;
    });
    return await Future.wait(awaitList);
  }
}

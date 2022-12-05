import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/item_produto.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/dto/venda.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_venda_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_cliente_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_produto_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_usuario_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_venda_auth.dart';
import 'package:delivery_app_supplier/service/service_entity_auth.dart';

class ServiceVendaAuth<T extends Venda, U extends Usuario, V extends Fornecedor> extends ServiceEntityAuth<T, U> implements IServiceVendaAuth<T, U, V> {
  IRepositoryVendaAuth<T, U, V> repositoryVenda;

  IServiceProdutoAuth serviceProduto;
  IServiceClienteAuth serviceCliente;
  IServiceUsuarioAuth serviceUsuario;

  ServiceVendaAuth(this.repositoryVenda, this.serviceProduto, this.serviceCliente, this.serviceUsuario) : super(repositoryVenda);

  @override
  Future<List<T>> getByFornecedor(V fornecedor) async {
    return await repositoryVenda.getByFornecedor(fornecedor);
  }

  @override
  Future<void> includeProdutos(List<T> vendas) async {
    for (Venda venda in vendas) {
      for (ItemProduto itemProduto in venda.itensProduto) {
        final produto = await serviceProduto.get(itemProduto.produto.id);
        if (produto != null) {
          itemProduto.produto = produto;
        }
      }
    }
  }

  @override
  Future<void> includeClienteAndUsuario(List<T> vendas) async {
    for (Venda venda in vendas) {
      final cliente = await serviceCliente.get(venda.cliente.id);
      if (cliente != null) {
        venda.cliente = cliente;
        final usuario = await serviceUsuario.get(cliente.usuario.id);
        if (usuario != null) {
          venda.cliente.usuario = usuario;
        }
      }
    }
  }

  @override
  Future<void> cancelar(T venda) async {
    await repositoryVenda.cancelar(venda);
  }

  @override
  Future<void> confirmar(T venda) async {
    await repositoryVenda.confirmar(venda);
  }
}

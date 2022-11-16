import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/produto.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_produto_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_produto_auth.dart';
import 'package:delivery_app_supplier/service/service_entity_auth.dart';

class ServiceProdutoAuth<T extends Produto, U extends Usuario, V extends Fornecedor> extends ServiceEntityAuth<T, U> implements IServiceProdutoAuth<T, U, V> {
  IRepositoryProdutoAuth<T, U, V> repositoryProduto;

  ServiceProdutoAuth(this.repositoryProduto) : super(repositoryProduto);

  @override
  Future<List<T>> getByFornecedor(V fornecedor) async {
    return await repositoryProduto.getByFornecedor(fornecedor);
  }
}

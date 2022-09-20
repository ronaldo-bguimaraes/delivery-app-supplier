import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_fornecedor_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_fornecedor_auth.dart';
import 'package:delivery_app_supplier/service/service_entity_auth.dart';

class ServiceFornecedorAuth<T extends Fornecedor, U extends Usuario> extends ServiceEntityAuth<T, U> implements IServiceFornecedorAuth<T, U> {
  IRepositoryFornecedorAuth<T, U> repositoryFornecedor;

  ServiceFornecedorAuth(this.repositoryFornecedor) : super(repositoryFornecedor);

  @override
  Future<T?> getByUsuario(U usuario) {
    return repositoryFornecedor.getByUsuario(usuario);
  }
}

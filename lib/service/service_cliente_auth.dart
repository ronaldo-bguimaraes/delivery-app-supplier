import 'package:delivery_app_supplier/dto/cliente.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_cliente_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_cliente_auth.dart';
import 'package:delivery_app_supplier/service/service_entity_auth.dart';

class ServiceClienteAuth<T extends Cliente, U extends Usuario> extends ServiceEntityAuth<T, U> implements IServiceClienteAuth<T, U> {
  IRepositoryClienteAuth<T, U> repositoryCliente;

  ServiceClienteAuth(this.repositoryCliente) : super(repositoryCliente);

  @override
  Future<T?> getByUsuario(U usuario) {
    return repositoryCliente.getByUsuario(usuario);
  }
}

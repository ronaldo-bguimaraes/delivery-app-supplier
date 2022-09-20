import 'package:delivery_app_supplier/dto/cliente.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_auth.dart';

abstract class IRepositoryClienteAuth<T extends Cliente, U extends Usuario> extends IRepositoryAuth<T, U> {
  Future<T?> getByUsuario(U usuario);
}

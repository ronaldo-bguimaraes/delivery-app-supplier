import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_auth.dart';

abstract class IRepositoryFornecedorAuth<T extends Fornecedor, U extends Usuario> extends IRepositoryAuth<T, U> {
  Future<T?> getByUsuario(U usuario);
}

import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_auth.dart';

abstract class IRepositoryUsuarioAuth<T extends Usuario, U extends Usuario> extends IRepositoryAuth<T, U> {
  Future<T> signIn(T usuario);
}

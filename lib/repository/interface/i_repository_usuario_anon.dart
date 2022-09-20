import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_anon.dart';

abstract class IRepositoryUsuarioAnon<T extends Usuario, U extends Usuario> extends IRepositoryAnon<T, U> {
  Future<T> signUp(T usuario);
  Future<T> signIn(T usuario);
  Future<void> signOut();
  Future<T> getCurrentUser();
}

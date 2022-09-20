import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_usuario_anon.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';

class ServiceAuth<T extends Usuario, U extends Usuario> implements IServiceAuth<T> {
  T? _usuario;

  final IRepositoryUsuarioAnon<T, U> repositoryUsuario;

  ServiceAuth(this.repositoryUsuario);

  @override
  T? get currentUser {
    return _usuario;
  }

  @override
  String? get currentToken {
    return _usuario?.token;
  }

  T _updateUsuario(T usuario) {
    _usuario = usuario;
    return usuario;
  }

  @override
  Future<T> signIn(T usuario) async {
    final user = await repositoryUsuario.signIn(usuario);
    return _updateUsuario(user);
  }

  @override
  Future<T> signUp(T usuario) async {
    final user = await repositoryUsuario.signUp(usuario);
    return await signIn(user);
  }

  @override
  Future<T> getCurrentUser() async {
    final usuario = await repositoryUsuario.getCurrentUser();
    _usuario = usuario;
    return usuario;
  }

  @override
  Future<void> signOut() async {
    await repositoryUsuario.signOut();
  }

  @override
  Future<String?> getCurrentToken() async {
    final usuario = await repositoryUsuario.getCurrentUser();
    _usuario = usuario;
    return usuario.token;
  }
}

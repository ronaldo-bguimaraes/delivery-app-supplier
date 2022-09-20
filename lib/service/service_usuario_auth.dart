import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_usuario_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_usuario_auth.dart';
import 'package:delivery_app_supplier/service/service_entity_auth.dart';

class ServiceUsuarioAuth<T extends Usuario, U extends Usuario> extends ServiceEntityAuth<T, U> implements IServiceUsuarioAuth<T, U> {
  IRepositoryUsuarioAuth<T, U> repositoryUsuario;

  ServiceUsuarioAuth(this.repositoryUsuario) : super(repositoryUsuario);
}

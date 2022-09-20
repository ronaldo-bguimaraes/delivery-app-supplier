import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_anon.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';

abstract class IRepositoryAuth<T extends IEntity, U extends Usuario> extends IRepositoryAnon<T, U> {
  abstract final IServiceAuth<U> auth;
}

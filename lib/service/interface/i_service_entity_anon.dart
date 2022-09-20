import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_anon.dart';

abstract class IServiceEntityAnon<T extends IEntity, U extends Usuario> {
  abstract final IRepositoryAnon<T, U> repositoryEntity;

  Future<T> save(T entity);
  Future<List<T>> all();
  Future<void> delete(T entity);
  Future<T?> get(int? id);
}

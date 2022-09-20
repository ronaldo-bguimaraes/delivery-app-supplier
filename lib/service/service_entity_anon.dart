import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_anon.dart';
import 'package:delivery_app_supplier/service/interface/i_service_entity_anon.dart';

class ServiceEntityAnon<T extends IEntity, U extends Usuario> implements IServiceEntityAnon<T, U> {
  @override
  final IRepositoryAnon<T, U> repositoryEntity;

  ServiceEntityAnon(this.repositoryEntity);

  @override
  Future<List<T>> all() async {
    return await repositoryEntity.getAll();
  }

  @override
  Future<void> delete(T entity) async {
    return await repositoryEntity.remove(entity);
  }

  @override
  Future<T?> get(int? id) async {
    return await repositoryEntity.getById(id);
  }

  @override
  Future<T> save(T entity) async {
    return await repositoryEntity.save(entity);
  }
}

import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_supplier/config/interface/i_config.dart';

abstract class IRepositoryAnon<T extends IEntity, U extends Usuario> {
  abstract final IConfig config;
  abstract final IMapper<T> mapper;
  abstract final String subPath;

  Future<T> save(T entity);
  Future<List<T>> getAll();
  Future<void> remove(T entity);
  Future<T?> getById(int? id);
}

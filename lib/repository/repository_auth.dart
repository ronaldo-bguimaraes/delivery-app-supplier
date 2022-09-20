import 'dart:io';
import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/json/json_tool.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_anon.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:delivery_app_supplier/config/interface/i_config.dart';
import 'package:http/http.dart' as http;

abstract class RepositoryAuth<T extends IEntity, U extends Usuario> extends IRepositoryAnon<T, U> implements IRepositoryAuth<T, U> {
  @override
  abstract final IConfig config;

  @override
  abstract final IServiceAuth<U> auth;

  @override
  abstract final IMapper<T> mapper;

  @override
  abstract final String subPath;

  get fullPath => '${config.basePath}/$subPath';

  @override
  Future<T> save(T entity) async {
    await http.post(
      Uri.parse('$fullPath/save'),
      body: JsonTool.encode(mapper.toMap(entity)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${auth.currentToken}',
      },
    );
    return entity;
  }

  @override
  Future<List<T>> getAll() async {
    final response = await http.get(
      Uri.parse(fullPath),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${auth.currentToken}',
      },
    );
    List list = JsonTool.decode(response.body);
    return list.map((e) => mapper.fromMap(e)).toList();
  }

  @override
  Future<void> remove(T entity) async {
    await http.delete(
      Uri.parse(fullPath),
      body: JsonTool.encode(mapper.toMap(entity)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${auth.currentToken}',
      },
    );
  }

  @override
  Future<T?> getById(int? id) async {
    final response = await http.get(
      Uri.parse('$fullPath/$id'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${auth.currentToken}',
      },
    );
    return mapper.fromMap(JsonTool.decode(response.body));
  }
}

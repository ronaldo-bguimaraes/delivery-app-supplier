import 'dart:io';
import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/json/json_tool.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_anon.dart';
import 'package:delivery_app_supplier/config/interface/i_config.dart';
import 'package:http/http.dart' as http;

abstract class RepositoryAnon<T extends IEntity, U extends Usuario> implements IRepositoryAnon<T, U> {
  @override
  abstract final IConfig config;

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
      },
    );
    return entity;
  }

  @override
  Future<List<T>> getAll() async {
    final response = await http.get(
      Uri.parse(fullPath),
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
      },
    );
  }

  @override
  Future<T?> getById(int? id) async {
    final response = await http.get(
      Uri.parse('$fullPath/$id'),
    );
    return mapper.fromMap(JsonTool.decode(response.body));
  }
}

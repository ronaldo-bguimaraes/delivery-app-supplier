import 'dart:io';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/json/json_tool.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_usuario_auth.dart';
import 'package:delivery_app_supplier/repository/repository_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:delivery_app_supplier/config/interface/i_config.dart';
import 'package:http/http.dart' as http;

class RepositoryUsuarioAuth<T extends Usuario, U extends Usuario> extends RepositoryAuth<T, U> implements IRepositoryUsuarioAuth<T, U> {
  @override
  IConfig config;

  @override
  IServiceAuth<U> auth;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'usuarios';

  RepositoryUsuarioAuth(this.config, this.auth, this.mapper);

  Future<T> add(T entity) async {
    await http.post(
      Uri.parse('$fullPath'),
      body: JsonTool.encode(mapper.toMap(entity)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
    );
    return entity;
  }

  Future<T> update(T entity) async {
    await http.put(
      Uri.parse('$fullPath'),
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
  Future<T> save(T entity) async {
    if (entity.id == 0) {
      return await update(entity);
    }
    return await add(entity);
  }

  @override
  Future<T> signIn(T usuario) async {
    final p = await http.post(
      Uri.parse('$fullPath/login'),
      body: JsonTool.encode(mapper.toMap(usuario)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
    );
    return mapper.fromMap(JsonTool.decode(p.body));
  }
}

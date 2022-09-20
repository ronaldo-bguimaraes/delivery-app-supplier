import 'dart:io';

import 'package:delivery_app_supplier/dto/endereco.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/json/json_tool.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_endereco_auth.dart';
import 'package:delivery_app_supplier/repository/repository_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:delivery_app_supplier/config/interface/i_config.dart';
import 'package:http/http.dart' as http;

class RepositoryEnderecoAuth<T extends Endereco, U extends Usuario> extends RepositoryAuth<T, U> implements IRepositoryEnderecoAuth<T, U> {
  @override
  IConfig config;

  @override
  IServiceAuth<U> auth;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'enderecos';

  RepositoryEnderecoAuth(this.config, this.auth, this.mapper);

  @override
  Future<List<T>> getByUsuario(U usuario) async {
    final response = await http.get(
      Uri.parse('$fullPath/usuarios/${usuario.id}'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${auth.currentToken}',
      },
    );
    List list = JsonTool.decode(response.body);
    return list.map((e) => mapper.fromMap(e)).toList();
  }
}

import 'dart:io';
import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/json/json_tool.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_fornecedor_auth.dart';
import 'package:delivery_app_supplier/repository/repository_auth.dart';
import 'package:delivery_app_supplier/config/interface/i_config.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:http/http.dart' as http;

class RepositoryFornecedorAuth<T extends Fornecedor, U extends Usuario> extends RepositoryAuth<T, U> implements IRepositoryFornecedorAuth<T, U> {
  @override
  IConfig config;

  @override
  IServiceAuth<U> auth;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'fornecedores';

  RepositoryFornecedorAuth(this.config, this.auth, this.mapper);

  @override
  Future<T?> getByUsuario(U usuario) async {
    final response = await http.get(
      Uri.parse('$fullPath/usuarios/${usuario.id}'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${auth.currentToken}',
      },
    );
    return mapper.fromMap(JsonTool.decode(response.body));
  }
}

import 'dart:io';
import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/dto/venda.dart';
import 'package:delivery_app_supplier/json/json_tool.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_venda_auth.dart';
import 'package:delivery_app_supplier/repository/repository_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:delivery_app_supplier/config/interface/i_config.dart';
import 'package:http/http.dart' as http;

class RepositoryVendaAuth<T extends Venda, U extends Usuario, V extends Fornecedor> extends RepositoryAuth<T, U> implements IRepositoryVendaAuth<T, U, V> {
  @override
  IConfig config;

  @override
  IServiceAuth<U> auth;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'vendas';

  RepositoryVendaAuth(this.config, this.auth, this.mapper);

  @override
  Future<List<T>> getByFornecedor(V fornecedor) async {
    final response = await http.get(
      Uri.parse('$fullPath/fornecedores/${fornecedor.id}'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${auth.currentToken}',
      },
    );
    List list = JsonTool.decode(response.body);
    return list.map((e) => mapper.fromMap(e)).toList();
  }

  @override
  Future<void> confirmar(T venda) async {
    await http.get(
      Uri.parse('$fullPath/confirmar/${venda.id}'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${auth.currentToken}',
      },
    );
  }

  @override
  Future<void> cancelar(T venda) async {
    await http.get(
      Uri.parse('$fullPath/cancelar/${venda.id}'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${auth.currentToken}',
      },
    );
  }
}

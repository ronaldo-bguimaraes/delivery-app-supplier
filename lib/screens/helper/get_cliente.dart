import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_fornecedor_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<Fornecedor> getCurrentFornecedor(BuildContext context) async {
  final Usuario? usuario = context.read<IServiceAuth>().currentUser;
  if (usuario == null) {
    throw Exception('Usuário não está logado');
  }
  Fornecedor? fornecedor = await context.read<IServiceFornecedorAuth>().getByUsuario(usuario);
  if (fornecedor == null) {
    throw Exception('Fornecedor não encontrado');
  }
  fornecedor.usuario = usuario;
  return fornecedor;
}

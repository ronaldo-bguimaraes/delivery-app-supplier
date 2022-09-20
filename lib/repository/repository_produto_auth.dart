import 'package:delivery_app_supplier/dto/produto.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_produto_auth.dart';
import 'package:delivery_app_supplier/repository/repository_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:delivery_app_supplier/config/interface/i_config.dart';

class RepositoryProdutoAuth<T extends Produto, U extends Usuario> extends RepositoryAuth<T, U> implements IRepositoryProdutoAuth<T, U> {
  @override
  IConfig config;

  @override
  IServiceAuth<U> auth;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'produtos';

  RepositoryProdutoAuth(this.config, this.auth, this.mapper);
}

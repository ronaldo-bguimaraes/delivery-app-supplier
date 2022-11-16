import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/dto/item_produto.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_item_produto_auth.dart';
import 'package:delivery_app_supplier/repository/repository_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:delivery_app_supplier/config/interface/i_config.dart';

class RepositoryItemProdutoAuth<T extends ItemProduto, U extends Usuario> extends RepositoryAuth<T, U> implements IRepositoryItemProdutoAuth<T, U> {
  @override
  IConfig config;

  @override
  IServiceAuth<U> auth;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'itens_produto';

  RepositoryItemProdutoAuth(this.config, this.auth, this.mapper);
}

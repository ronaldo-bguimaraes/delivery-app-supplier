import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/dto/item_produto.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_auth.dart';

abstract class IRepositoryItemProdutoAuth<T extends ItemProduto, U extends Usuario> extends IRepositoryAuth<T, U> {}

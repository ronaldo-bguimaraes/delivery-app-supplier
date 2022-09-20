import 'package:delivery_app_supplier/dto/produto.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_auth.dart';

abstract class IRepositoryProdutoAuth<T extends Produto, U extends Usuario> extends IRepositoryAuth<T, U> {}

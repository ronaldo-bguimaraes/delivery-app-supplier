import 'package:delivery_app_supplier/dto/produto.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/service/interface/i_service_entity_auth.dart';

abstract class IServiceProdutoAuth<T extends Produto, U extends Usuario> extends IServiceEntityAuth<T, U> {}

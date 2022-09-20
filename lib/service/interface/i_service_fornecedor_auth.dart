import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/service/interface/i_service_entity_auth.dart';

abstract class IServiceFornecedorAuth<T extends Fornecedor, U extends Usuario> extends IServiceEntityAuth<T, U> {
  Future<T?> getByUsuario(U usuario);
}

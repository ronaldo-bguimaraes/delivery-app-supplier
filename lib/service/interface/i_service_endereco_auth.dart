import 'package:delivery_app_supplier/dto/endereco.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/service/interface/i_service_entity_auth.dart';

abstract class IServiceEnderecoAuth<T extends Endereco, U extends Usuario> extends IServiceEntityAuth<T, U> {
  Future<List<T>> getByUsuario(U usuario);
}

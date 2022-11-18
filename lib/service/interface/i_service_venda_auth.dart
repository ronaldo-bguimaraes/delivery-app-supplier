import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/dto/venda.dart';
import 'package:delivery_app_supplier/service/interface/i_service_entity_auth.dart';

abstract class IServiceVendaAuth<T extends Venda, U extends Usuario, V extends Fornecedor> extends IServiceEntityAuth<T, U> {
  Future<List<T>> getByFornecedor(V cliente);

  Future<void> includeProdutos(List<T> vendas);

  Future<void> includeClienteAndUsuario(List<T> vendas);
}

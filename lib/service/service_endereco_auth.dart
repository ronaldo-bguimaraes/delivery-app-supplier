import 'package:delivery_app_supplier/dto/endereco.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_endereco_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_endereco_auth.dart';
import 'package:delivery_app_supplier/service/service_entity_auth.dart';

class ServiceEnderecoAuth<T extends Endereco, U extends Usuario> extends ServiceEntityAuth<T, U> implements IServiceEnderecoAuth<T, U> {
  IRepositoryEnderecoAuth<T, U> repositoryEndereco;

  ServiceEnderecoAuth(this.repositoryEndereco) : super(repositoryEndereco);

  @override
  Future<List<T>> getByUsuario(U usuario) async {
    return await repositoryEndereco.getByUsuario(usuario);
  }
}

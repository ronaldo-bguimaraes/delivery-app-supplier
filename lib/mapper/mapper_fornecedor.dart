import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_fornecedor.dart';

class MapperFornecedor<T extends Fornecedor> implements IMapperFornecedor {
  @override
  Map<String, dynamic> toMap(Fornecedor fornecedor) {
    return {
      'id': fornecedor.id.toInt(),
      'cnpj': fornecedor.cnpj,
      'razaoSocial': fornecedor.razaoSocial,
      'usuarioId': fornecedor.usuario.id.toInt(),
    };
  }

  @override
  Fornecedor fromMap(Map<String, dynamic> map) {
    return Fornecedor(
      id: map['id']?.toInt(),
      cnpj: map['cnpj'],
      razaoSocial: map['razaoSocial'],
      usuario: Usuario(
        id: map['usuarioId']?.toInt(),
      ),
    );
  }
}

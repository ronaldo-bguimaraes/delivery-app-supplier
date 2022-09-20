import 'package:delivery_app_supplier/dto/cliente.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_cliente.dart';

class MapperCliente<T extends Cliente> implements IMapperCliente {
  @override
  Map<String, dynamic> toMap(Cliente cliente) {
    return {
      'id': cliente.id.toInt(),
      'cpf': cliente.cpf,
      'dataNascimento': cliente.dataNascimento.toIso8601String(),
      'usuarioId': cliente.usuario.id.toInt(),
    };
  }

  @override
  Cliente fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id']?.toInt(),
      cpf: map['cpf'],
      dataNascimento: DateTime.parse(map['dataNascimento']),
      usuario: Usuario(
        id: map['usuarioId'].toInt(),
      ),
    );
  }
}

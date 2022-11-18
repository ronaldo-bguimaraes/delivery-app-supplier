import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_usuario.dart';

class MapperUsuario implements IMapperUsuario {
  @override
  Map<String, dynamic> toMap(Usuario usuario) {
    return {
      'id': usuario.id.toInt(),
      'nome': usuario.nome,
      'telefone': usuario.telefone,
      'email': usuario.email,
      'senha': usuario.senha,
      'dataCadastro': usuario.dataCadastro.toIso8601String(),
      'token': usuario.token,
    };
  }

  @override
  Usuario fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'].toInt(),
      nome: map['nome'],
      telefone: map['telefone'],
      email: map['email'],
      dataCadastro: DateTime.parse(map['dataCadastro']),
      token: map['token'] ?? "",
    );
  }
}

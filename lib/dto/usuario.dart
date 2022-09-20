import 'package:delivery_app_supplier/dto/cliente.dart';
import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';

class Usuario extends IEntity {
  @override
  int id;
  String nome;
  String telefone;
  String email;
  String senha;
  DateTime dataCadastro;
  String token;

  Usuario({
    this.id = 0,
    this.nome = '',
    this.telefone = '',
    this.email = '',
    this.senha = '',
    DateTime? dataCadastro,
    this.token = '',
    Cliente? cliente,
  }) : dataCadastro = dataCadastro ?? DateTime.now();
}

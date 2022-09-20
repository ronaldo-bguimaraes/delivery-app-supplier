import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';

class Cliente extends IEntity {
  @override
  int id;
  String cpf;
  DateTime dataNascimento;
  Usuario usuario;

  Cliente({
    this.id = 0,
    this.cpf = '',
    DateTime? dataNascimento,
    Usuario? usuario,
  })  : dataNascimento = DateTime.now(),
        usuario = usuario ?? Usuario();
}

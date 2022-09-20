import 'package:delivery_app_supplier/dto/inteface/i_entity.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';

class Endereco extends IEntity {
  @override
  int id;
  String nome;
  String apelido;
  String complemento;
  String descricao;
  double latitude;
  double longitude;
  Usuario usuario;

  Endereco({
    this.id = 0,
    this.nome = '',
    this.apelido = '',
    this.complemento = '',
    this.descricao = '',
    this.latitude = 0,
    this.longitude = 0,
    Usuario? usuario,
  }) : usuario = usuario ?? Usuario();
}

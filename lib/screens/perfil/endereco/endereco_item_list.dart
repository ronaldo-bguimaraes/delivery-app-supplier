import 'package:delivery_app_supplier/dto/endereco.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:flutter/material.dart';

class EnderecoItemList {
  final String nome;
  final String apelido;
  final String complemento;
  final String descricao;
  final double latitude;
  final double longitude;
  final Usuario usuario;
  final void Function(BuildContext) event;

  const EnderecoItemList({
    required this.nome,
    required this.apelido,
    required this.complemento,
    required this.descricao,
    required this.latitude,
    required this.longitude,
    required this.usuario,
    required this.event,
  });

  factory EnderecoItemList.fromEndereco(Endereco endereco) {
    return EnderecoItemList(
      nome: endereco.nome,
      apelido: endereco.apelido,
      complemento: endereco.complemento,
      descricao: endereco.descricao,
      latitude: endereco.latitude,
      longitude: endereco.longitude,
      usuario: endereco.usuario,
      event: (ctx) {
        //
      },
    );
  }
}

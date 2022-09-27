import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/dto/endereco.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/screens/perfil/endereco/endereco_list.dart';
import 'package:delivery_app_supplier/screens/perfil/list_item.dart';
import 'package:delivery_app_supplier/screens/perfil/meus_dados.dart';
import 'package:delivery_app_supplier/screens/perfil/minhas_formas_pagamento.dart';
import 'package:delivery_app_supplier/screens/user/user_sign_in.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_fornecedor_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_endereco_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final List<ListItem> _list = [
    ListItem(
      title: 'Meus Dados',
      subTitle: 'Dados da minha conta',
      icon: Icons.description,
      event: (context) async {
        final Usuario? usuario = context.read<IServiceAuth>().currentUser;
        if (usuario == null) {
          throw Exception('Usuário não está logado');
        }
        Fornecedor? fornecedor = await context.read<IServiceFornecedorAuth>().getByUsuario(usuario);
        if (fornecedor == null) {
          throw Exception('Fornecedor não encontrado');
        }
        fornecedor.usuario = usuario;
        //
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return MeusDados(fornecedor: fornecedor);
          }),
        );
      },
    ),
    ListItem(
      title: 'Pagamentos',
      subTitle: 'Meus pagamentos e cartões',
      icon: Icons.payment,
      event: (context) {
        Navigator.of(context).pushNamed(MinhasFormasPagamento.routeName);
      },
    ),
    ListItem(
      title: 'Endereços',
      subTitle: 'Meus endereços de venda',
      icon: Icons.location_pin,
      event: (context) async {
        final Usuario? usuario = context.read<IServiceAuth>().currentUser;
        if (usuario == null) {
          throw Exception('Usuário não está logado');
        }
        //
        List<Endereco> enderecos = await context.read<IServiceEnderecoAuth>().getByUsuario(usuario);
        //
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return EnderecoList(usuario: usuario, enderecos: enderecos);
          }),
        );
      },
    ),
    ListItem(
      title: 'Sair',
      subTitle: 'Sair do aplicativo',
      icon: Icons.logout,
      event: (context) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          UserSignIn.routeName,
          (route) => false,
        );
      },
    ),
  ];

  late Usuario? _usuario;

  @override
  void initState() {
    super.initState();
    _usuario = context.read<IServiceAuth>().currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('./assets/images/fornecedor.png'),
              radius: 20,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(
              width: 20,
            ),
            Text('${_usuario?.nome}', overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            var item = _list[index];
            return GestureDetector(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Icon(item.icon),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              item.subTitle,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      const Expanded(
                        flex: 0,
                        child: Icon(
                          Icons.arrow_forward,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                item.event(context);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
              color: Colors.black26,
            );
          },
          itemCount: _list.length,
        ),
      ),
    );
  }
}

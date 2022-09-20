import 'package:delivery_app_supplier/dto/endereco.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/screens/perfil/endereco/endereco_add.dart';
import 'package:delivery_app_supplier/screens/perfil/endereco/endereco_item_list.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnderecoList extends StatefulWidget {
  final Usuario usuario;
  final List<Endereco> enderecos;

  const EnderecoList({Key? key, required this.usuario, required this.enderecos}) : super(key: key);

  @override
  State<EnderecoList> createState() => _EnderecoListState();
}

class _EnderecoListState extends State<EnderecoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Endereços'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final endereco = widget.enderecos[index];
          final enderecoItemList = EnderecoItemList.fromEndereco(endereco);
          return GestureDetector(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            enderecoItemList.apelido,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            enderecoItemList.nome,
                            style: const TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            enderecoItemList.descricao,
                            style: const TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              enderecoItemList.event(context);
            },
            behavior: HitTestBehavior.opaque,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: Colors.black26,
          );
        },
        itemCount: widget.enderecos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Usuario? usuario = context.read<IServiceAuth>().currentUser;
          if (usuario == null) {
            throw Exception('Usuário não está logado');
          }
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return EnderecoAdd(usuario: usuario);
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

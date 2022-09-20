import 'package:delivery_app_supplier/dto/endereco.dart';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/screens/component/full_scroll.dart';
import 'package:delivery_app_supplier/screens/home/home.dart';
import 'package:delivery_app_supplier/service/interface/i_service_endereco_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:provider/provider.dart';

class EnderecoAdd extends StatefulWidget {
  final Usuario usuario;

  const EnderecoAdd({Key? key, required this.usuario}) : super(key: key);

  @override
  State<EnderecoAdd> createState() => _EnderecoAddState();
}

class _EnderecoAddState extends State<EnderecoAdd> {
  final _formKey = GlobalKey<FormState>();
  late final GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];

  final _endereco = Endereco();

  final _descricaoController = TextEditingController();

  bool enabled = true;

  @override
  void initState() {
    super.initState();
    googlePlace = GooglePlace('AIzaSyAmFaKZOL7BhmvpocjiFdeWIGG0aWa-pho');
    _descricaoController.text = _endereco.descricao;
    _endereco.usuario.id = widget.usuario.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Endereço'),
      ),
      body: FullScroll(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  children: [
                    TextFormField(
                      initialValue: _endereco.apelido,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Apelido',
                      ),
                      onSaved: (value) {
                        _endereco.apelido = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O apelido não pode ser vazio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: _endereco.complemento,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Complemento',
                      ),
                      onSaved: (value) {
                        _endereco.complemento = value!;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      child: TextFormField(
                        controller: _descricaoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Endereço',
                        ),
                        onChanged: (value) async {
                          if (value.isEmpty) {
                            setState(() {
                              predictions = [];
                            });
                          }
                          //
                          else {
                            try {
                              final result = await googlePlace.autocomplete.get(
                                value,
                                language: 'pt_BR',
                              );
                              //
                              if (result != null && result.predictions != null) {
                                setState(() {
                                  predictions = result.predictions!;
                                });
                              }
                              //
                              else {
                                setState(() {
                                  predictions = [];
                                });
                              }
                            }
                            //
                            catch (error) {
                              debugPrint(error.toString());
                            }
                          }
                        },
                        enabled: enabled,
                      ),
                      onTap: () {
                        if (enabled == false) {
                          _descricaoController.text = '';
                          setState(() {
                            enabled = true;
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Builder(
                      builder: (context) {
                        if (predictions.isNotEmpty) {
                          return SizedBox(
                            height: 300,
                            child: ListView.separated(
                              itemCount: predictions.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const CircleAvatar(
                                    child: Icon(
                                      Icons.location_pin,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Text(predictions[index].description!),
                                  onTap: () async {
                                    final prediction = predictions[index];
                                    final response = await googlePlace.details.get(
                                      prediction.placeId ?? '',
                                      language: 'pt_BR',
                                    );
                                    final DetailsResult? result = response?.result;
                                    if (result != null) {
                                      _endereco.nome = result.name ?? '';
                                      _endereco.descricao = result.formattedAddress ?? '';
                                      _endereco.latitude = result.geometry?.location?.lat ?? 0;
                                      _endereco.longitude = result.geometry?.location?.lng ?? 0;
                                    }
                                    setState(() {
                                      predictions = [];
                                      enabled = false;
                                      _descricaoController.text = _endereco.descricao;
                                    });
                                  },
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return const Divider(
                                  height: 1,
                                  color: Colors.black26,
                                );
                              },
                            ),
                          );
                        }
                        //
                        else if (enabled) {
                          return const Text('Comece a digitar para exibir as sugestões');
                        } else {
                          return const Text('Clique no campo acima para editá-lo');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      child: const Text('Salvar'),
                      onPressed: () async {
                        var state = _formKey.currentState;
                        if (state != null) {
                          state.save();
                        }
                        if (state != null && state.validate()) {
                          try {
                            context.read<IServiceEnderecoAuth>().save(_endereco);
                            //
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              Home.routeName,
                              (route) => false,
                            );
                          }
                          //
                          catch (error) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Erro'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const [
                                        Text('Erro ao cadastrar endereco'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                      ),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

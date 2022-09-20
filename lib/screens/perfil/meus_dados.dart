import 'package:delivery_app_supplier/dto/cliente.dart';
import 'package:delivery_app_supplier/screens/component/full_scroll.dart';
import 'package:delivery_app_supplier/screens/home/home.dart';
import 'package:delivery_app_supplier/screens/mask/cpf_mask.dart';
import 'package:delivery_app_supplier/screens/mask/date_mask.dart';
import 'package:delivery_app_supplier/screens/mask/phone_mask.dart';
import 'package:delivery_app_supplier/service/interface/i_service_cliente_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_usuario_auth.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MeusDados extends StatefulWidget {
  final Cliente cliente;

  const MeusDados({Key? key, required this.cliente}) : super(key: key);

  @override
  State<MeusDados> createState() => _MeusDadosState();
}

class _MeusDadosState extends State<MeusDados> {
  final _formKey = GlobalKey<FormState>();

  late final TextInputMask _cpfMask;
  late final TextInputMask _phoneMask;
  late final TextInputMask _dateMask;

  final _dateFormat = DateFormat('dd/MM/yyyy');

  late final Cliente _cliente;

  @override
  void initState() {
    super.initState();
    _cliente = widget.cliente;

    _cpfMask = getCpfMask();
    _phoneMask = getPhoneMask();
    _dateMask = getDateMask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus dados'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return FullScroll(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: _cliente.usuario.nome,
                      onSaved: (value) {
                        _cliente.usuario.nome = value!;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O nome não pode ser vazio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: _cpfMask.magicMask.getMaskedString(_cliente.cpf),
                      onSaved: (value) {
                        _cliente.cpf = value!.replaceAll(RegExp(r'\D'), '');
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CPF',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        _cpfMask,
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O CPF não pode ser vazio';
                        }
                        if (value.length < 14) {
                          return 'CPF inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: _phoneMask.magicMask.getMaskedString(_cliente.usuario.telefone),
                      onSaved: (value) {
                        _cliente.usuario.telefone = value!.replaceAll(RegExp(r'\D'), '');
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Telefone',
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        _phoneMask,
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O telefone não pode ser vazio';
                        }
                        if (value.length < 14) {
                          return 'Telefone inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: _cliente.usuario.email,
                      onSaved: (value) {
                        _cliente.usuario.email = value!;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O email não pode ser vazio';
                        }
                        if (EmailValidator.validate(value) == false) {
                          return 'Email inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: _dateFormat.format(_cliente.dataNascimento),
                      onSaved: (value) {
                        _cliente.dataNascimento = _dateFormat.parse(value!);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Data de nascimento',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        _dateMask,
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A data de nascimento não pode ser vazia';
                        }
                        if (value.length < 10) {
                          return 'Data de nascimento inválida';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: _cliente.usuario.senha,
                      onSaved: (value) {
                        _cliente.usuario.senha = value!;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirme a Senha',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A senha não pode ser vazia';
                        }
                        if (value.length < 8) {
                          return 'A senha deve ter pelo menos 8 caracteres';
                        }
                        if (value != _cliente.usuario.senha) {
                          return 'As senhas não correspondem';
                        }
                        return null;
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
                            await context.read<IServiceUsuarioAuth>().save(_cliente.usuario);
                            await context.read<IServiceClienteAuth>().save(_cliente);
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
                                        Text('Erro ao cadastrar cliente'),
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
              ),
            ),
          );
        },
      ),
    );
  }
}

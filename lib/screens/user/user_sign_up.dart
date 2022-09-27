import 'package:delivery_app_supplier/dto/fornecedor.dart';
import 'package:delivery_app_supplier/screens/component/full_scroll.dart';
import 'package:delivery_app_supplier/screens/home/home.dart';
import 'package:delivery_app_supplier/screens/mask/cnpj_mask.dart';
import 'package:delivery_app_supplier/screens/mask/date_mask.dart';
import 'package:delivery_app_supplier/screens/mask/phone_mask.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_fornecedor_auth.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserSignUp extends StatefulWidget {
  static const String routeName = '/user-sign-up';

  const UserSignUp({Key? key}) : super(key: key);

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final _formKey = GlobalKey<FormState>();

  late final TextInputMask _cnpjMask;
  late final TextInputMask _phoneMask;

  Fornecedor _fornecedor = Fornecedor();

  @override
  void initState() {
    super.initState();
    _cnpjMask = getCnpjMask();
    _phoneMask = getPhoneMask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crie a sua conta'),
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
                      initialValue: _fornecedor.usuario.nome,
                      onSaved: (value) {
                        _fornecedor.usuario.nome = value!;
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
                      initialValue: _fornecedor.razaoSocial,
                      onSaved: (value) {
                        _fornecedor.razaoSocial = value!;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Razão Social',
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A razão social não pode ser vazia';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: _fornecedor.cnpj,
                      onSaved: (value) {
                        _fornecedor.cnpj = value!.replaceAll(RegExp(r'\D'), '');
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CNPJ',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        _cnpjMask,
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O CNPJ não pode ser vazio';
                        }
                        if (value.length < 14) {
                          return 'CNPJ inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: _fornecedor.usuario.telefone,
                      onSaved: (value) {
                        _fornecedor.usuario.telefone = value!.replaceAll(RegExp(r'\D'), '');
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
                      initialValue: _fornecedor.usuario.email,
                      onSaved: (value) {
                        _fornecedor.usuario.email = value!;
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
                      initialValue: _fornecedor.usuario.senha,
                      onSaved: (value) {
                        _fornecedor.usuario.senha = value!;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A senha não pode ser vazia';
                        }
                        if (value.length < 8) {
                          return 'A senha deve ter pelo menos 8 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: '',
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
                        if (value != _fornecedor.usuario.senha) {
                          return 'As senhas não correspondem';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      child: const Text('Cadastrar'),
                      onPressed: () async {
                        var state = _formKey.currentState;
                        if (state != null) {
                          state.save();
                        }
                        if (state != null && state.validate()) {
                          try {
                            _fornecedor.usuario = await context.read<IServiceAuth>().signUp(_fornecedor.usuario);
                            // create fornecdor profile
                            _fornecedor = await context.read<IServiceFornecedorAuth>().save(_fornecedor);
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
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

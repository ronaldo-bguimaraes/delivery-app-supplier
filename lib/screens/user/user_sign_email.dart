import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/screens/component/full_scroll.dart';
import 'package:delivery_app_supplier/screens/home/home.dart';
import 'package:delivery_app_supplier/screens/user/user_sign_up.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserSignInEmail extends StatefulWidget {
  static const String routeName = '/user-sign-in-email';

  const UserSignInEmail({Key? key}) : super(key: key);

  @override
  State<UserSignInEmail> createState() => _UserSignInEmailState();
}

class _UserSignInEmailState extends State<UserSignInEmail> {
  final _formKey = GlobalKey<FormState>();

  Usuario _usuario = Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entre com Email'),
      ),
      body: FullScroll(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Image(
                  image: AssetImage('./assets/images/restaurante.png'),
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Delivery para Fornecedores',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  initialValue: _usuario.email,
                  onSaved: (value) {
                    _usuario.email = value!;
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
                  initialValue: _usuario.senha,
                  onSaved: (value) {
                    _usuario.senha = value!;
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
                ElevatedButton(
                  child: const Text(
                    'Entrar',
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () async {
                    var state = _formKey.currentState;
                    if (state != null) {
                      state.save();
                    }
                    if (state != null && state.validate()) {
                      try {
                        _usuario = await context.read<IServiceAuth>().signIn(_usuario);
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
                                    Text('Email ou senha incorretos'),
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
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  child: const Text('Crie uma conta'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      UserSignUp.routeName,
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }
}

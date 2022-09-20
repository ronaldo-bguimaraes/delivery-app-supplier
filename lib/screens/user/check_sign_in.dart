import 'package:delivery_app_supplier/screens/home/home.dart';
import 'package:delivery_app_supplier/screens/user/user_sign_in.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckSignIn extends StatelessWidget {
  static const String routeName = '/check-sign-in';
  const CheckSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<IServiceAuth>().getCurrentUser(),
      builder: (ctx, snapshot) => snapshot.hasData ? const Home() : const UserSignIn(),
    );
  }
}

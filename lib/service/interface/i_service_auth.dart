import 'package:delivery_app_supplier/dto/usuario.dart';

abstract class IServiceAuth<T extends Usuario> {
  T? get currentUser;
  String? get currentToken;
  Future<T> signIn(T usuario);
  Future<T> signUp(T usuario);
  Future<void> signOut();

  Future<T?> getCurrentUser();
  Future<String?> getCurrentToken();
}

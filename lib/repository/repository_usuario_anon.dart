import 'dart:io';
import 'package:delivery_app_supplier/dto/usuario.dart';
import 'package:delivery_app_supplier/json/json_tool.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_usuario_anon.dart';
import 'package:delivery_app_supplier/repository/repository_anon.dart';
import 'package:delivery_app_supplier/config/interface/i_config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryUsuarioAnon<T extends Usuario, U extends Usuario> extends RepositoryAnon<T, U> implements IRepositoryUsuarioAnon<T, U> {
  @override
  IConfig config;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'usuarios';

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  RepositoryUsuarioAnon(this.config, this.mapper);

  @override
  Future<T> signUp(T usuario) async {
    await http.post(
      Uri.parse('$fullPath'),
      body: JsonTool.encode(mapper.toMap(usuario)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
    );
    return _saveLocal(usuario);
  }

  @override
  Future<T> signIn(T usuario) async {
    final response = await http.post(
      Uri.parse('$fullPath/login'),
      body: JsonTool.encode(mapper.toMap(usuario)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
    );
    usuario = mapper.fromMap(JsonTool.decode(response.body));
    return _saveLocal(usuario);
  }

  Future<T> _saveLocal(T usuario) async {
    final prefs = await _prefs;
    final string = JsonTool.encode(mapper.toMap(usuario));
    prefs.setString('local_user', string);
    return usuario;
  }

  Future<void> _removeLocal() async {
    final prefs = await _prefs;
    prefs.remove('local_user');
  }

  Future<T> _getLocal() async {
    final prefs = await _prefs;
    final json = JsonTool.decode(prefs.getString('local_user') ?? '');
    return mapper.fromMap(json);
  }

  @override
  Future<T> getCurrentUser() async {
    return await _getLocal();
  }

  @override
  Future<void> signOut() async {
    return await _removeLocal();
  }
}

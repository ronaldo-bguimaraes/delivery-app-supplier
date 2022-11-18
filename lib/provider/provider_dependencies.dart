import 'package:delivery_app_supplier/mapper/interface/i_mapper_cliente.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_endereco.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_fornecedor.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_item_produto.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_produto.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_usuario.dart';
import 'package:delivery_app_supplier/mapper/interface/i_mapper_venda.dart';
import 'package:delivery_app_supplier/mapper/mapper_cliente.dart';
import 'package:delivery_app_supplier/mapper/mapper_endereco.dart';
import 'package:delivery_app_supplier/mapper/mapper_fornecedor.dart';
import 'package:delivery_app_supplier/mapper/mapper_item_produto.dart';
import 'package:delivery_app_supplier/mapper/mapper_produto.dart';
import 'package:delivery_app_supplier/mapper/mapper_usuario.dart';
import 'package:delivery_app_supplier/mapper/mapper_venda.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_cliente_auth.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_endereco_auth.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_fornecedor_auth.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_item_produto_auth.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_produto_auth.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_usuario_auth.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_usuario_anon.dart';
import 'package:delivery_app_supplier/repository/interface/i_repository_venda_auth.dart';
import 'package:delivery_app_supplier/repository/repository_cliente_auth.dart';
import 'package:delivery_app_supplier/repository/repository_endereco_auth.dart';
import 'package:delivery_app_supplier/repository/repository_fornecedor_auth.dart';
import 'package:delivery_app_supplier/repository/repository_item_produto_auth.dart';
import 'package:delivery_app_supplier/repository/repository_produto_auth.dart';
import 'package:delivery_app_supplier/repository/repository_usuario_auth.dart';
import 'package:delivery_app_supplier/repository/repository_usuario_anon.dart';
import 'package:delivery_app_supplier/repository/repository_venda_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_cart.dart';
import 'package:delivery_app_supplier/service/interface/i_service_cliente_auth.dart';
import 'package:delivery_app_supplier/config/interface/i_config.dart';
import 'package:delivery_app_supplier/service/interface/i_service_endereco_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_fornecedor_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_produto_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_usuario_auth.dart';
import 'package:delivery_app_supplier/service/interface/i_service_usuario_anon.dart';
import 'package:delivery_app_supplier/service/interface/i_service_venda_auth.dart';
import 'package:delivery_app_supplier/service/service_auth.dart';
import 'package:delivery_app_supplier/service/service_cart.dart';
import 'package:delivery_app_supplier/service/service_cliente_auth.dart';
import 'package:delivery_app_supplier/config/config.dart';
import 'package:delivery_app_supplier/service/service_endereco_auth.dart';
import 'package:delivery_app_supplier/service/service_fornecedor_auth.dart';
import 'package:delivery_app_supplier/service/service_produto_auth.dart';
import 'package:delivery_app_supplier/service/service_usuario_auth.dart';
import 'package:delivery_app_supplier/service/service_usuario_anon.dart';
import 'package:delivery_app_supplier/service/service_venda_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderDependencies extends StatelessWidget {
  final Widget child;

  const ProviderDependencies({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IMapperCliente>(
          create: (ctx) => MapperCliente(),
          lazy: true,
        ),
        Provider<IMapperFornecedor>(
          create: (ctx) => MapperFornecedor(),
          lazy: true,
        ),
        Provider<IMapperUsuario>(
          create: (ctx) => MapperUsuario(),
          lazy: true,
        ),
        Provider<IMapperEndereco>(
          create: (ctx) => MapperEndereco(),
          lazy: true,
        ),
        Provider<IMapperProduto>(
          create: (ctx) => MapperProduto(),
          lazy: true,
        ),
        Provider<IMapperItemProduto>(
          create: (ctx) => MapperItemProduto(),
          lazy: true,
        ),
        Provider<IMapperVenda>(
          create: (ctx) => MapperVenda(
            ctx.read<IMapperItemProduto>(),
          ),
          lazy: true,
        ),
        Provider<IConfig>(
          create: (ctx) => Config(),
          lazy: true,
        ),
        Provider<IRepositoryUsuarioAnon>(
          create: (ctx) => RepositoryUsuarioAnon(
            ctx.read<IConfig>(),
            ctx.read<IMapperUsuario>(),
          ),
          lazy: true,
        ),
        Provider<IServiceAuth>(
          create: (ctx) => ServiceAuth(
            ctx.read<IRepositoryUsuarioAnon>(),
          ),
          lazy: true,
        ),
        Provider<IRepositoryUsuarioAuth>(
          create: (ctx) => RepositoryUsuarioAuth(
            ctx.read<IConfig>(),
            ctx.read<IServiceAuth>(),
            ctx.read<IMapperUsuario>(),
          ),
          lazy: true,
        ),
        Provider<IRepositoryClienteAuth>(
          create: (ctx) => RepositoryClienteAuth(
            ctx.read<IConfig>(),
            ctx.read<IServiceAuth>(),
            ctx.read<IMapperCliente>(),
          ),
          lazy: true,
        ),
        Provider<IRepositoryFornecedorAuth>(
          create: (ctx) => RepositoryFornecedorAuth(
            ctx.read<IConfig>(),
            ctx.read<IServiceAuth>(),
            ctx.read<IMapperFornecedor>(),
          ),
          lazy: true,
        ),
        Provider<IRepositoryEnderecoAuth>(
          create: (ctx) => RepositoryEnderecoAuth(
            ctx.read<IConfig>(),
            ctx.read<IServiceAuth>(),
            ctx.read<IMapperEndereco>(),
          ),
          lazy: true,
        ),
        Provider<IRepositoryProdutoAuth>(
          create: (ctx) => RepositoryProdutoAuth(
            ctx.read<IConfig>(),
            ctx.read<IServiceAuth>(),
            ctx.read<IMapperProduto>(),
          ),
          lazy: true,
        ),
        Provider<IRepositoryItemProdutoAuth>(
          create: (ctx) => RepositoryItemProdutoAuth(
            ctx.read<IConfig>(),
            ctx.read<IServiceAuth>(),
            ctx.read<IMapperItemProduto>(),
          ),
          lazy: true,
        ),
        Provider<IRepositoryVendaAuth>(
          create: (ctx) => RepositoryVendaAuth(
            ctx.read<IConfig>(),
            ctx.read<IServiceAuth>(),
            ctx.read<IMapperVenda>(),
          ),
          lazy: true,
        ),
        Provider<IServiceUsuarioAnon>(
          create: (ctx) => ServiceUsuarioAnon(
            ctx.read<IRepositoryUsuarioAnon>(),
          ),
          lazy: true,
        ),
        Provider<IServiceUsuarioAuth>(
          create: (ctx) => ServiceUsuarioAuth(
            ctx.read<IRepositoryUsuarioAuth>(),
          ),
          lazy: true,
        ),
        Provider<IServiceClienteAuth>(
          create: (ctx) => ServiceClienteAuth(
            ctx.read<IRepositoryClienteAuth>(),
          ),
          lazy: true,
        ),
        Provider<IServiceFornecedorAuth>(
          create: (ctx) => ServiceFornecedorAuth(
            ctx.read<IRepositoryFornecedorAuth>(),
          ),
          lazy: true,
        ),
        Provider<IServiceEnderecoAuth>(
          create: (ctx) => ServiceEnderecoAuth(
            ctx.read<IRepositoryEnderecoAuth>(),
          ),
          lazy: true,
        ),
        Provider<IServiceProdutoAuth>(
          create: (ctx) => ServiceProdutoAuth(
            ctx.read<IRepositoryProdutoAuth>(),
          ),
          lazy: true,
        ),
        ChangeNotifierProvider<IServiceCart>(
          create: (ctx) => ServiceCart(),
          lazy: true,
        ),
        Provider<IServiceVendaAuth>(
          create: (ctx) => ServiceVendaAuth(
            ctx.read<IRepositoryVendaAuth>(),
            ctx.read<IServiceProdutoAuth>(),
            ctx.read<IServiceClienteAuth>(),
            ctx.read<IServiceUsuarioAuth>(),
          ),
          lazy: true,
        ),
      ],
      child: child,
    );
  }
}

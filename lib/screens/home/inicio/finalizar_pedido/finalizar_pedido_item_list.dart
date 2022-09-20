import 'package:flutter/material.dart';

class FinalizarPedidoItem {
  final String title;
  final ImageProvider<Object> image;
  final void Function(BuildContext) event;

  const FinalizarPedidoItem({
    required this.title,
    required this.image,
    required this.event,
  });
}

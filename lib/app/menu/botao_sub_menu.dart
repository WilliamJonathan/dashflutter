import 'package:flutter/material.dart';

class BotaoSubMenu extends StatelessWidget {
  final String titulo;
  final VoidCallback acao;

  const BotaoSubMenu({super.key, required this.titulo, required this.acao});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: acao,
      child: Text(
        titulo,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

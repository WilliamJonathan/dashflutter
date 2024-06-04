import 'package:dashflutter/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AreaDeTrabalho extends StatelessWidget {
  const AreaDeTrabalho({
    super.key,
    required this.menuListenable,
    required this.larguraMenu,
    required this.screenWidth,
    required this.titulo,
    required this.widget,
    this.actions,
  });
  final MenuListenable menuListenable;
  final double larguraMenu;
  final double screenWidth;
  final String titulo;
  final Widget widget;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: menuListenable,
      builder: (context, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          width: menuListenable.menuAberto
              ? screenWidth - larguraMenu
              : screenWidth,
          transform: menuListenable.menuAberto
              ? Matrix4.translationValues(larguraMenu, 0, 0)
              : Matrix4.translationValues(0, 0, 0),
          child: child,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(titulo),
          leading: IconButton(
            onPressed: () => menuListenable.abrirFechar(),
            icon: const Icon(Icons.menu),
          ),
          actions: actions,
        ),
        body: widget,
      ),
    );
  }
}

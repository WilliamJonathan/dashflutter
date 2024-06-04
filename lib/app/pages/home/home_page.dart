import 'package:dashflutter/app/pages/home/components/area_trabalho.dart';
import 'package:dashflutter/app/pages/home/components/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuListenable extends ChangeNotifier {
  bool menuAberto = false;

  void abrirFechar() {
    menuAberto = !menuAberto;
    notifyListeners();
  }
}

class WidgetAtualListenable extends ChangeNotifier {
  String _tituloDaPagina = '';
  Widget? _meuWidget;

  Widget? get meuWidget => _meuWidget;
  String get tituloDaPagina => _tituloDaPagina;
  void trocarWidget({required Widget widget, required String titulo}) {
    _meuWidget = widget;
    _tituloDaPagina = titulo;
    notifyListeners();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MenuListenable menuListenable = MenuListenable();
  final WidgetAtualListenable widgetAtualListenable = WidgetAtualListenable();
  double larguraMenu = 250;
  Widget? meuWidget;

  @override
  void initState() {
    widgetAtualListenable.trocarWidget(
        widget: const Center(
          child: Text('Inicio'),
        ),
        titulo: 'Inicio');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        children: [
          MenuLateral(
            menuListenable: menuListenable,
            larguraMenu: larguraMenu,
            widgetAtualListenable: widgetAtualListenable,
          ),
          ListenableBuilder(
              listenable: widgetAtualListenable,
              builder: (context, _) {
                return AreaDeTrabalho(
                  menuListenable: menuListenable,
                  larguraMenu: larguraMenu,
                  screenWidth: screenWidth,
                  titulo: widgetAtualListenable.tituloDaPagina,
                  widget: widgetAtualListenable.meuWidget ??
                      const Text(
                        'Ops! Erro desconhecido entre em contato com o suporte',
                      ),
                );
              }),
        ],
      ),
    );
  }
}

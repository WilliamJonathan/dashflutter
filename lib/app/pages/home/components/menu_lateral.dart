import 'package:dashflutter/app/menu/botao_sub_menu.dart';
import 'package:dashflutter/app/menu/item_menu.dart';
import 'package:dashflutter/app/menu/item_sub_menu.dart';
import 'package:dashflutter/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({
    super.key,
    required this.menuListenable,
    required this.larguraMenu,
    required this.widgetAtualListenable,
  });
  final MenuListenable menuListenable;
  final double larguraMenu;
  final WidgetAtualListenable widgetAtualListenable;
  @override
  Widget build(BuildContext context) {
    List<ItemMenu> listaMenus = [
      ItemMenu(
        titulo: 'Paginas',
        subMenus: [
          ItemSubMenu(
            titulo: 'Pagina 1',
            acao: () => widgetAtualListenable.trocarWidget(
              widget: const Center(
                child: Text('pagina 1'),
              ),
              titulo: 'PAGINA 1',
            ),
          ),
          ItemSubMenu(
            titulo: 'Pagina 2',
            acao: () => widgetAtualListenable.trocarWidget(
              widget: const Center(
                child: Text('pagina 2'),
              ),
              titulo: 'PAGINA 2',
            ),
          )
        ],
      ),
      ItemMenu(
        titulo: 'Outro',
        acao: () => widgetAtualListenable.trocarWidget(
          widget: const Center(
            child: Text('outro'),
          ),
          titulo: 'outro',
        ),
      ),
    ];
    return Drawer(
      width: larguraMenu,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: listaMenus.length,
            itemBuilder: (context, index) {
              final itemMenu = listaMenus[index];
              if (itemMenu.subMenus == null) {
                return ListTile(
                  title: Text(itemMenu.titulo),
                  onTap: itemMenu.acao,
                );
              } else {
                return ExpansionPanelList.radio(
                  elevation: 0,
                  dividerColor: Colors.transparent,
                  children: [
                    ExpansionPanelRadio(
                      value: index,
                      canTapOnHeader: true,
                      backgroundColor: Colors.transparent,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text(itemMenu.titulo),
                        );
                      },
                      body: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: itemMenu.subMenus!
                                  .map(
                                    (subMenu) => BotaoSubMenu(
                                      titulo: subMenu.titulo,
                                      acao: subMenu.acao,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

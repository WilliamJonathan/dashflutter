import 'package:dashflutter/app/menu/item_sub_menu.dart';

class ItemMenu {
  final String titulo;
  List<ItemSubMenu>? subMenus;
  final void Function()? acao;

  ItemMenu({required this.titulo, this.subMenus, this.acao});
}

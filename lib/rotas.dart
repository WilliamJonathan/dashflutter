import 'package:dashflutter/app/pages/home/home_page.dart';
import 'package:dashflutter/app/pages/outro/outro_page.dart';
import 'package:flutter/material.dart';

class Rotas {
  static Route<dynamic>? gerarRotas(RouteSettings settings) {
    final Map<String, WidgetBuilder> routes = {
      '/home': (context) => const HomePage(),
      '/outro': (context) {
        final args = settings.arguments as String;
        return OutroPage(data: args);
      },
      // Adicione mais rotas conforme necessário
    };

    final WidgetBuilder? builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    } else {
      return _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Não encontrado 404'),
        ),
        body: const Center(
          child: Text('Página não encontrada 404'),
        ),
      );
    });
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Rota Desconhecida'),
        ),
        body: Center(
          child: Text('Rota desconhecida: ${settings.name}'),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';

class OutroPage extends StatefulWidget {
  const OutroPage({super.key, this.data});
  final String? data;

  @override
  State<OutroPage> createState() => _OutroPageState();
}

class _OutroPageState extends State<OutroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Outra pagina: ${widget.data}'),
      ),
    );
  }
}

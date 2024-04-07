import 'package:flutter/material.dart';

class ViewScaffold extends StatelessWidget {
  const ViewScaffold({super.key, this.children});

  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        color: const Color(0xfffaf8ef),
        child: SafeArea(
          left: false,
          right: false,
          child: Stack(
            children: children!,
          ),
        ),
      ),
    );
  }
}

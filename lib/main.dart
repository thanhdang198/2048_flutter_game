import 'package:flutter/material.dart';
import 'components/game_stage.dart';
import 'components/view_scaffold.dart';

void main() => runApp(const GameApp());

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<StatefulWidget> createState() => GameAppState();
}

class GameAppState extends State<GameApp> {
  @override
  Widget build(BuildContext context) {
    return const ViewScaffold(
      children: <Widget>[
        GameStage(),
      ],
    );
  }
}

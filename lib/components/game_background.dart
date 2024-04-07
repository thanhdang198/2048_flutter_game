import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../store/game_state.dart';
import '../utils/screen.dart';

class GameBg extends StatefulWidget {
  const GameBg({super.key});

  @override
  State<StatefulWidget> createState() => GameBgState();
}

class GameBgState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, GameBgProps>(
      converter: (store) => GameBgProps(
        borderWidth: Screen.getBorderWidth(store.state.mode),
        blockWidth: Screen.getBlockWidth(store.state.mode),
        mode: store.state.mode,
      ),
      builder: (context, vm) {
        return Container(
          padding: EdgeInsets.fromLTRB(vm.borderWidth!, vm.borderWidth!, 0, 0),
          decoration: BoxDecoration(
            color: const Color(0xffbbada0),
            border: Border.all(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(5),
          ),
          child: getGrid(vm),
        );
      },
    );
  }

  getGrid(GameBgProps props) {
    var rows = <Widget>[];
    for (var i = 0; i < props.mode!; i++) {
      var columns = <Widget>[];
      for (var j = 0; j < props.mode!; j++) {
        columns.add(Container(
          width: props.blockWidth,
          height: props.blockWidth,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(238, 228, 218, 0.35),
            border: Border.all(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(5),
          ),
          margin:
              EdgeInsets.fromLTRB(0, 0, props.borderWidth!, props.borderWidth!),
        ));
      }
      rows.add(Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: columns,
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: rows,
    );
  }
}

class GameBgProps {
  double? borderWidth;
  double? blockWidth;
  int? mode;

  GameBgProps({this.borderWidth, this.blockWidth, this.mode});
}

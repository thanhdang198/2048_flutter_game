import 'package:flutter/material.dart';
import 'package:flutter_game/actions/game_init.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../store/game_state.dart';

class ModeSelector extends StatelessWidget {
  const ModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, ModeSelectorProps>(
      converter: (store) {
        return ModeSelectorProps(
          mode: store.state.mode,
          onChange: (mode) => gameInit(store, mode),
        );
      },
      builder: (context, vm) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ElevatedButton(
              // color: Color(0xff8f7a66),
              // textColor: Colors.white,
              onPressed: () => vm.onChange!(3),
              child: const Text('3 x 3'),
            ),
            ElevatedButton(
              // color: Color(0xff8f7a66),
              // textColor: Colors.white,
              onPressed: () => vm.onChange!(4),
              child: const Text('4 x 4'),
            ),
            ElevatedButton(
              // color: Color(0xff8f7a66),
              // textColor: Colors.white,
              onPressed: () => vm.onChange!(6),
              child: const Text('6 x 6'),
            ),
          ],
        );
      },
    );
  }
}

class ModeSelectorProps {
  ModeSelectorProps({this.mode, this.onChange});

  int? mode;
  Function? onChange;
}

import 'package:flutter/material.dart';
import 'package:flutter_game/actions/game_init.dart';
import 'package:flutter_game/components/blocks.dart';
import 'package:flutter_game/components/scores.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'game_background.dart';
import 'mode_selector.dart';
import 'playground.dart';
import '../constants/Display.dart';
import '../reducers/index.dart';
import '../store/game_state.dart';

class GameStage extends StatelessWidget {
  const GameStage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    // ScreenUtil.instance = ScreenUtil(width: 750)..init(context);
    return StoreProvider(
      store: Store<GameState>(
        gameReducer,
        middleware: [thunkMiddleware],
        initialState: GameState.initial(4),
      ),
      child: StoreConnector<GameState, GameProps>(
        converter: (store) =>
            GameProps(started: store.state.status!.total != null),
        onInit: (store) {
          gameInit(store, 4);
        },
        builder: (context, props) {
          return props.started!
              ? Container(
                  margin: EdgeInsets.all(Display.borderMargin),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ModeSelector(),
                      Scores(),
                      Stack(
                        children: <Widget>[
                          GameBg(),
                          Blocks(),
                          Playground(),
                        ],
                      ),
                    ],
                  ),
                )
              : Container();
        },
      ),
    );
  }
}

class GameProps {
  bool? started;

  GameProps({this.started});
}

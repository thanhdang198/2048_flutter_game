import 'package:flutter/material.dart';
import 'package:flutter_game/actions/game_init.dart';
import 'package:flutter_game/store/game_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scores extends StatelessWidget {
  const Scores({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, ScoresProps>(
      converter: (store) => ScoresProps(
        scores: store.state.status!.scores,
        total: store.state.status!.total,
        isEnd: store.state.status!.end,
        reset: () {
          gameInit(store, store.state.mode);
        },
      ),
      onDidChange: (props, _) {
        if (props!.isEnd! && props.scores! > props.total!) {
          SharedPreferences.getInstance().then((refs) {
            refs.setInt('total_' + props.mode.toString(), props.scores!);
          });
        }
      },
      builder: (context, props) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  '2048',
                  style: TextStyle(
                      fontSize: 50,
                      color: Color(0xff776e65),
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(23, 5, 23, 5),
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xffbbada0),
                        border: Border.all(color: Colors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'SCORE',
                            style: TextStyle(
                                color: Color(0xffeee4da),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            props.scores.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(23, 5, 23, 5),
                      decoration: BoxDecoration(
                        color: const Color(0xffbbada0),
                        border: Border.all(color: Colors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'BEST',
                            style: TextStyle(
                                color: Color(0xffeee4da),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            props.total.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Play 2048 Game flutter',
                      style: TextStyle(
                          color: Color(0xff776e65),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Join and get to the 2048 tile!',
                      style: TextStyle(color: Color(0xff776e65)),
                    ),
                  ],
                ),
                ElevatedButton(
                  // color: Color(0xff8f7a66),
                  // textColor: Colors.white,
                  onPressed: () => props.reset!(),
                  child: const Text(
                    'New Game',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class ScoresProps {
  ScoresProps({this.mode, this.total, this.scores, this.isEnd, this.reset});

  int? mode;
  int? total;
  int? scores;
  bool? isEnd;
  Function? reset;
}

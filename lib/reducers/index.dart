import 'package:flutter_game/reducers/update_state.dart';
import 'move_down.dart';
import 'move_left.dart';
import 'move_right.dart';
import 'move_up.dart';
import '../store/game_state.dart';
import 'package:redux/redux.dart';

final gameReducer = combineReducers<GameState>([
  TypedReducer<GameState, UpdateStateAction>(updateState).call,
  TypedReducer<GameState, MoveLeftAction>(moveLeft).call,
  TypedReducer<GameState, MoveRightAction>(moveRight).call,
  TypedReducer<GameState, MoveUpAction>(moveUp).call,
  TypedReducer<GameState, MoveDownAction>(moveDown).call,
]);

import 'package:flutter/widgets.dart';
import 'package:flutter_game/store/game_state.dart';
import 'package:flutter_game/utils/screen.dart';
import 'package:flutter_redux/flutter_redux.dart';

abstract class BaseBlock extends AnimatedWidget {
  const BaseBlock({super.key, required Animation animation})
      : super(
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, BlockProps>(
      converter: (store) => BlockProps(
        blockWidth: Screen.getBlockWidth(store.state.mode),
        borderWidth: Screen.getBorderWidth(store.state.mode),
        mode: store.state.mode,
      ),
      builder: buildBlock,
    );
  }

  @protected
  Widget buildBlock(
    BuildContext context,
    BlockProps props,
  );
}

class BlockProps {
  double? blockWidth;
  double? borderWidth;
  int? mode;

  BlockProps({this.blockWidth, this.borderWidth, this.mode});
}

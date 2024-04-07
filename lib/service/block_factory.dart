import 'package:flutter/widgets.dart';
import 'package:flutter_game/components/block/combin_block.dart';
import 'package:flutter_game/components/block/move_block.dart';
import 'package:flutter_game/components/block/new_block.dart';
import 'package:flutter_game/components/block/static_block.dart';
import 'package:flutter_game/store/block_info.dart';

class BlockFactory {
  late AnimationController combineController;
  late AnimationController addController;
  AnimationController? moveController;
  int? _mode;

  BlockFactory(TickerProvider provider, int? mode) {
    combineController = AnimationController(
        duration: const Duration(milliseconds: 60), vsync: provider);
    addController = AnimationController(
        duration: const Duration(milliseconds: 80), vsync: provider);
    moveController = AnimationController(
        duration: const Duration(milliseconds: 95), vsync: provider);
    _mode = mode;
  }

  Widget create(BlockInfo info) {
    if (info.isNew) {
      return NewBlock(
        info: info,
        controller: addController,
      );
    }

    if (info.needMove && info.needCombine) {
      return CombineBlock(
        info: info,
        mode: _mode,
        combineController: combineController,
        moveController: moveController,
      );
    }

    if (info.needMove && info.needCombine != true) {
      return MoveBlock(info: info, mode: _mode!, controller: moveController!);
    }

    return StaticBlock(
      info: info,
      controller: addController,
    );
  }

  play() {
    moveController!.forward().whenComplete(() {
      addController.forward();
      combineController.forward().whenComplete(() {
        combineController.reverse();
      });
    });
  }
}

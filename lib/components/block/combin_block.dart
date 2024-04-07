import 'package:flutter/material.dart';
import 'package:flutter_game/components/number_text.dart';
import 'package:flutter_game/components/block/base_block.dart';
import 'package:flutter_game/components/block/move_block.dart';
import 'package:flutter_game/store/block_info.dart';

class CombineBlock extends BaseBlock {
  final BlockInfo? info;
  final int? mode;
  final AnimationController? moveController;

  CombineBlock({
    super.key,
    this.info,
    this.mode,
    this.moveController,
    required AnimationController combineController,
  }) : super(
          animation:
              Tween<double>(begin: 1, end: 1.25).animate(combineController),
        );

  @override
  Widget buildBlock(BuildContext context, BlockProps props) {
    Animation<double> animation = listenable as Animation<double>;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        MoveBlock(
          info: BlockInfo(
            isNew: false,
            value: info!.value ~/ 2,
            before: info!.before,
            current: info!.current,
          ),
          mode: mode!,
          controller: moveController!,
        ),
        Positioned(
          top: (info!.current ~/ props.mode!) *
              (props.blockWidth! + props.borderWidth!),
          left: (info!.current % props.mode!) *
              (props.blockWidth! + props.borderWidth!),
          child: Transform.scale(
            scale: animation.value,
            origin: const Offset(0.5, 0.5),
            child: NumberText(value: info!.value, size: props.blockWidth),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_game/components/number_text.dart';
import 'package:flutter_game/components/block/base_block.dart';
import 'package:flutter_game/store/block_info.dart';

class NewBlock extends BaseBlock {
  final BlockInfo? info;

  NewBlock({
    super.key,
    this.info,
    required AnimationController controller,
  }) : super(
          animation: Tween<double>(begin: 0.1, end: 1.0).animate(controller),
        );

  @override
  Widget buildBlock(BuildContext context, BlockProps props) {
    Animation<double> animation = listenable as Animation<double>;
    return Positioned(
      top: (info!.current ~/ props.mode!) *
          (props.blockWidth! + props.borderWidth!),
      left: (info!.current % props.mode!) *
          (props.blockWidth! + props.borderWidth!),
      child: Transform.scale(
        scale: animation.value,
        origin: const Offset(0.5, 0.5),
        child: NumberText(value: info!.value, size: props.blockWidth),
      ),
    );
  }
}

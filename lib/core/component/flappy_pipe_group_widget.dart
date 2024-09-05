import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappybird/core/component/flappy_pipe_widget.dart';
import 'package:flappybird/core/flappy_config.dart';
import 'package:flappybird/core/state/flappy_pipe_position_state.dart';
import 'package:flappybird/view/flappy_game_screen.dart';

class FlappyPipeGroupWidget extends PositionComponent with HasGameRef<FlappyGameScreen>{
  FlappyPipeGroupWidget();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - FlappyConfig.groundHeight;
    final spacing = 100 + _random.nextDouble() + (heightMinusGround / 4);
    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing);

    addAll([
      FlappyPipeWidget(
        height: centerY - spacing / 2,
        pipePositionState: FlappyPipePositionState.top,
      ),
      FlappyPipeWidget(
        height: heightMinusGround - (centerY + spacing / 2),
        pipePositionState: FlappyPipePositionState.bottom,
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= FlappyConfig.speed * dt;

    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.bird.score += 1;
  }
}

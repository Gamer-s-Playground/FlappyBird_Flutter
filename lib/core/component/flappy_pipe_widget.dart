import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/core/state/flappy_pipe_position_state.dart';
import 'package:flappybird/view/flappy_game_screen.dart';

class FlappyPipeWidget extends SpriteComponent with HasGameRef<FlappyGameScreen> {
  @override
  final double height;
  final FlappyPipePositionState pipePositionState;

  FlappyPipeWidget({
    required this.height,
    required this.pipePositionState,
  });

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load("pipe.png");
    final pipeRotated = await Flame.images.load("pipe_rotated.png");

    size = Vector2(50, height);
    switch (pipePositionState) {
      case FlappyPipePositionState.top :
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case FlappyPipePositionState.bottom :
        position.y = gameRef.size.y - size.y;
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
  }
}

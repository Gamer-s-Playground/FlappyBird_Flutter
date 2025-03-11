import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappybird/core/component/flappy_background_widget.dart';
import 'package:flappybird/core/component/flappy_bird_widget.dart';
import 'package:flappybird/core/component/flappy_floor_widget.dart';
import 'package:flappybird/core/component/flappy_pipe_group_widget.dart';
import 'package:flappybird/core/flappy_config.dart';

class FlappyGameScreen extends FlameGame
    with TapDetector, HasCollisionDetection, KeyboardEvents {
  FlappyGameScreen();

  late FlappyBirdWidget bird;
  late TextComponent score;
  Timer interval = Timer(FlappyConfig.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      FlappyBackgroundWidget(),
      FlappyFloorWidget(),
      bird = FlappyBirdWidget(),
    ]);

    interval.onTick = () => add(FlappyPipeGroupWidget());
  }
}

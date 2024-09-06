import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappybird/core/component/flappy_background_widget.dart';
import 'package:flappybird/core/component/flappy_bird_widget.dart';
import 'package:flappybird/core/component/flappy_floor_widget.dart';
import 'package:flappybird/core/component/flappy_pipe_group_widget.dart';
import 'package:flappybird/core/flappy_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlappyGameScreen extends FlameGame
    with TapDetector, HasCollisionDetection, KeyboardEvents {
  FlappyGameScreen();

  late FlappyBirdWidget bird;
  late TextComponent score;
  Timer interval = Timer(FlappyConfig.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;

    if (isKeyDown) {
      if (keysPressed.contains(LogicalKeyboardKey.keyB)) {
        if (overlays.isActive("mainMenu")) {
          overlays.remove("mainMenu");
          resumeEngine();
        } else if (overlays.isActive("gameOver")) {
          bird.reset();
          overlays.remove('gameOver');
          overlays.add('mainMenu');
        } else {
          onTap();
        }
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Future<void> onLoad() async {
    addAll([
      FlappyBackgroundWidget(),
      FlappyFloorWidget(),
      bird = FlappyBirdWidget(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(FlappyPipeGroupWidget());
  }

  TextComponent buildScore() {
    return TextComponent(
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'flappy',
        ),
      ),
    );
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score : ${bird.score}';
    if (bird.score >= 35) {
      overlays.add('gameOver');
      pauseEngine();
      isHit = true;
    }
  }
}

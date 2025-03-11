import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappybird/core/component/flappy_bird_widget.dart';
import 'package:flappybird/core/flappy_config.dart';
import 'package:flutter/material.dart';

class FlappyGameScreen extends FlameGame
    with TapDetector, HasCollisionDetection, KeyboardEvents {
  FlappyGameScreen();

  late FlappyBirdWidget bird;
  late TextComponent score;
  Timer interval = Timer(FlappyConfig.pipeInterval, repeat: true);
  bool isHit = false;

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
}

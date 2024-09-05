import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappybird/core/flappy_config.dart';
import 'package:flappybird/core/state/flappy_bird_movement_state.dart';
import 'package:flappybird/view/flappy_game_screen.dart';
import 'package:flutter/material.dart';

class FlappyBirdWidget extends SpriteGroupComponent<FlappyBirdMovementState>
    with HasGameRef<FlappyGameScreen>, CollisionCallbacks {
  FlappyBirdWidget();

  int score = 0;

  @override
  Future<void> onLoad() async {
    final birdMidFlap = await gameRef.loadSprite("bird_midflap.png");
    final birdUpFlap = await gameRef.loadSprite("bird_upflap.png");
    final birdDownFlap = await gameRef.loadSprite("bird_downflap.png");

    gameRef.bird;

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = FlappyBirdMovementState.middle;
    sprites = {
      FlappyBirdMovementState.middle: birdMidFlap,
      FlappyBirdMovementState.up: birdUpFlap,
      FlappyBirdMovementState.down: birdDownFlap,
    };

    add(CircleHitbox());
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, FlappyConfig.gravity),
        EffectController(
          duration: 0.2,
          curve: Curves.decelerate,
        ),
        onComplete: () => current = FlappyBirdMovementState.down,
      ),
    );
    //FlameAudio.play("fly.wav");
    current = FlappyBirdMovementState.up;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  void gameOver() {
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
    game.isHit = true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += FlappyConfig.birdVelocity * dt;
    if (position.y < 1) {
      gameOver();
    }
  }
}

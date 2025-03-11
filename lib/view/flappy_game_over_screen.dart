import 'package:flappybird/view/flappy_game_screen.dart';
import 'package:flutter/material.dart';

class FlappyGameOverScreen extends StatelessWidget {
  final FlappyGameScreen game;
  static const String id = 'gameOver';

  const FlappyGameOverScreen({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.black38,
      child: Placeholder(),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.overlays.add('mainMenu');
  }
}

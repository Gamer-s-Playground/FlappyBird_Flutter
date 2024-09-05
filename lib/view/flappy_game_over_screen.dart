import 'package:flappybird/core/flappy_config.dart';
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
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "score : ${game.bird.score}",
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: 'flappy',
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              "${FlappyConfig.imageAsset}/game_over.png",
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onRestart,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "다시 시도",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.overlays.add('mainMenu');
  }
}

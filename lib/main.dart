import 'package:flame/game.dart';
import 'package:flappybird/view/flappy_game_over_screen.dart';
import 'package:flappybird/view/flappy_game_screen.dart';
import 'package:flappybird/view/flappy_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyGameScreen();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [FlappyMenuScreen.id],
      overlayBuilderMap: {
        "mainMenu": (context, _) => FlappyMenuScreen(game: game),
        "gameOver": (context, _) => FlappyGameOverScreen(game: game),
      },
    ),
  );
}

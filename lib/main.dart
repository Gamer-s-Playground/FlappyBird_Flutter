import 'package:flame/game.dart';
import 'package:flappybird/view/flappy_game_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyGameScreen();
  runApp(
    GameWidget(
      game: game,
    ),
  );
}

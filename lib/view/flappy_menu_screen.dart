import 'package:flappybird/core/flappy_config.dart';
import 'package:flappybird/view/flappy_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlappyMenuScreen extends StatefulWidget {
  final FlappyGameScreen game;
  static const String id = 'mainMenu';

  const FlappyMenuScreen({
    super.key,
    required this.game,
  });

  @override
  State<FlappyMenuScreen> createState() => _FlappyMenuScreenState();
}

class _FlappyMenuScreenState extends State<FlappyMenuScreen> {

  @override
  Widget build(BuildContext context) {
    widget.game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          widget.game.overlays.remove('mainMenu');
          widget.game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "${FlappyConfig.imageAsset}/menu.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(
            "${FlappyConfig.imageAsset}/message.png",
          ),
        ),
      ),
    );
  }
}

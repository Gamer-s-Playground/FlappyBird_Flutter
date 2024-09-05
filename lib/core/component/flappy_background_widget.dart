import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/view/flappy_game_screen.dart';

class FlappyBackgroundWidget extends SpriteComponent with HasGameRef<FlappyGameScreen>{
  FlappyBackgroundWidget();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load("background.png");
    size = gameRef.size;
    sprite = Sprite(background);
  }
}

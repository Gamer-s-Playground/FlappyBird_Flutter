import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird/core/flappy_config.dart';
import 'package:flappybird/view/flappy_game_screen.dart';

class FlappyFloorWidget extends ParallaxComponent<FlappyGameScreen> with HasGameRef<FlappyGameScreen>{
  FlappyFloorWidget();

  @override
  Future<void> onLoad() async {
    final floor = await Flame.images.load("floor.png");
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(floor, fill: LayerFill.none),
      ),
    ]);

    add(
      RectangleHitbox(
        position: Vector2(0, gameRef.size.y - FlappyConfig.groundHeight),
        size: Vector2(gameRef.size.x, FlappyConfig.groundHeight),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = FlappyConfig.speed;
  }
}

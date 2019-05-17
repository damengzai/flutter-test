import 'package:flutter/material.dart';

import 'hero_animation.dart';

class HeroAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation Page2'),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: PhotoHero(
          photo: 'images/flippers-alpha.png',
          width: 100,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

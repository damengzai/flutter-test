import 'package:flutter/material.dart';

import 'hero_animation_page2.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Hero Animation"),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'images/flippers-alpha.png',
          width: 300,
          onTap: () {
//            Navigator.of(context).pushNamed('/heroAnimationPage2');
            Navigator.push(context, MaterialPageRoute(builder: (context) => HeroAnimationPage(),),);
          },
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
//      height: width,
      child: Hero(
        tag: photo,
        transitionOnUserGestures: true,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
//        flightShuttleBuilder: (flightContext, animation, direction, fromContext,
//            toContext) {
//          if (direction == HeroFlightDirection.push) {
//            //进入
//            return PhotoHero(photo: 'images/beachball-alpha.png',
//              width: 150,);
//          } else if(direction == HeroFlightDirection.pop) {
//            //返回
//            return PhotoHero(photo: 'images/chair-alpha.png',
//              width: 150,);
//          }
//        },
      ),
    );
  }
}

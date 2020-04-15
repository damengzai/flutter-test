import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AnimatedIconPage();
  }
}

class _AnimatedIconPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedIconState();
  }
}

class _AnimatedIconState extends State<_AnimatedIconPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<AnimatedIconData> _animatedIconsList = [
    AnimatedIcons.add_event,
    AnimatedIcons.event_add,
    AnimatedIcons.arrow_menu,
    AnimatedIcons.menu_arrow,
    AnimatedIcons.close_menu,
    AnimatedIcons.menu_close,
    AnimatedIcons.ellipsis_search,
    AnimatedIcons.search_ellipsis,
    AnimatedIcons.home_menu,
    AnimatedIcons.menu_home,
    AnimatedIcons.list_view,
    AnimatedIcons.view_list,
    AnimatedIcons.pause_play,
    AnimatedIcons.play_pause,
  ];
  bool isForward = false;

  void _playAnimation() {
    if (_controller != null) {
      if (isForward) {
        _controller.reverse();
        isForward = false;
      } else {
        _controller.forward();
        isForward = true;
      }
    }
  }

  Widget _generateItem(int index) {
    return Container(
      key: Key(index.toString()),
      child: Center(
        child: AnimatedIcon(
          icon: _animatedIconsList[index],
          progress: _controller,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.black54,
        border: Border.all(color: Colors.grey, width: 1),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..drive(Tween(begin: 0, end: 1))
      ..duration = Duration(milliseconds: 300);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          itemCount: _animatedIconsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) => _generateItem(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playAnimation,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

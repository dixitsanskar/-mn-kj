

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class riveImage extends StatefulWidget {
  const riveImage({super.key});

  @override
  State<riveImage> createState() => _riveImageState();
}

class _riveImageState extends State<riveImage> {

late RiveAnimationController _imageController;
  @override
  void initState() {
    super.initState();
    _imageController = OneShotAnimation("idle");
  }
  void _enterState(PointerEvent details){
    setState(() {
      _imageController = OneShotAnimation("urlo_loop", autoplay: true);
    });
  }
  void _exitState(PointerEvent details){
    setState(() {
      _imageController= OneShotAnimation("idle");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _enterState,
      onExit: _exitState,
      child: RiveAnimation.asset(
      "assets/images/dev.riv",
      controllers: [_imageController],
      fit: BoxFit.contain,
    ));
  }
}
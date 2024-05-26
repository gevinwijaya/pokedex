import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PokedexLoader extends StatelessWidget {
  const PokedexLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                offset: Offset(0,0),
                blurRadius: 16,
                spreadRadius: 4,
                color: Colors.black12
            )
          ]
      ),
      child: LoadingAnimationWidget.hexagonDots(
          color: Colors.black54, size: 30),
    );
  }

}
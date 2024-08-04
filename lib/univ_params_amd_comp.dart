import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

var defaultBorderRadius = BorderRadius.circular(16.0);

PreferredSizeWidget getDefaultAppBar({required String title}) {
  return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: Text(title),
      centerTitle: true,
    );  
}

class CustomLottieBg extends StatefulWidget {
  final Widget child;

  const CustomLottieBg({super.key, required this.child});

  @override
  State<CustomLottieBg> createState() => _CustomLottieBgState();
}

class _CustomLottieBgState extends State<CustomLottieBg>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: LottieBuilder.asset(
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..duration =
                    Duration(seconds: (composition.duration.inSeconds).round())
                ..repeat();
            },
            "assets/anim/bg_grad_2.json",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ),
        widget.child,
      ],
    );
  }
}

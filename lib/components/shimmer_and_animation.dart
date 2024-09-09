import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class AnimatedItemWidget extends StatefulWidget {
  final String imagePath;
  final String label;
  final Duration shimmerDuration;
  final Duration popInDuration;

  const AnimatedItemWidget({
    super.key,
    required this.imagePath,
    required this.label,
    this.shimmerDuration = const Duration(seconds: 1),
    this.popInDuration = const Duration(milliseconds: 500),
  });

  @override
  AnimatedShimmer createState() => AnimatedShimmer();
}

class AnimatedShimmer extends State<AnimatedItemWidget>
    with SingleTickerProviderStateMixin {
  late bool isLoading = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.popInDuration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = true;
      });
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? ScaleTransition(
            scale: _animation,
            child: Column(
              children: [
                Image.asset(widget.imagePath),
                const SizedBox(height: 7),
                Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        : Shimmer(
            duration: widget.shimmerDuration,
            color: Colors.grey.shade300,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 20,
                    offset: Offset(0, -1),
                    spreadRadius: 1,
                  )
                ],
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFFFFFF),
                    Color.fromARGB(255, 182, 182, 182),
                  ],
                ),
              ),
            ),
          );
  }
}

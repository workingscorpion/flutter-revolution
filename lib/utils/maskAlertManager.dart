import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';

class MaskAlertManager {
  static showMaskAlert({
    BuildContext context,
    IconData icon,
    Duration duration,
  }) async {
    await showDialog(
      context: context,
      barrierColor: Colors.transparent,
      child: MaskAlert(
        icon: icon,
        duration: duration ?? Duration(milliseconds: 500),
      ),
    );
  }
}

class MaskAlert extends StatefulWidget {
  MaskAlert({this.icon, this.duration});

  final IconData icon;
  final Duration duration;

  @override
  _MaskAlertState createState() => _MaskAlertState();
}

class _MaskAlertState extends State<MaskAlert>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  Size get size {
    return MediaQuery.of(context).size;
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.0),
      ),
    )..addListener(() {
        setState(() {});
      });

    Future.delayed(widget.duration, () => AppRouter.pop());
    controller.forward();
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    animation.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Opacity(
              opacity: 1 - animation.value,
              child: Container(
                width: size.width * .15 * (animation.value + 1),
                height: size.width * .15 * (animation.value + 1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(.3),
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 30 * (animation.value + 1),
                ),
              ),
            ),
            child: child(),
          ),
        ),
      ),
    );
  }

  child() => Container(
        width: animation.value * MediaQuery.of(context).size.width * .1,
        height: animation.value * MediaQuery.of(context).size.height * .1,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(.2),
        ),
        child: Icon(widget.icon),
      );
}

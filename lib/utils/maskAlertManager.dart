import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';

class MaskAlertManager {
  static showMaskAlert({
    BuildContext context,
    bool success,
    Duration duration,
  }) async {
    await showDialog(
      context: context,
      barrierColor: Colors.transparent,
      child: MaskAlert(
        success: true,
        duration: duration ?? Duration(milliseconds: 300),
      ),
    );
    // return MaskAlert(
    //   success: success,
    //   duration: duration ?? Duration(milliseconds: 300),
    // );
  }
}

class MaskAlert extends StatefulWidget {
  MaskAlert({this.success, this.duration});

  final bool success;
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
  Widget build(BuildContext context) {
    print(animation.value);
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Opacity(
              opacity: 1 - animation.value,
              child: Container(
                width: size.width * .2 * animation.value,
                height: size.width * .2 * animation.value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(.2),
                ),
                child: Icon(
                  widget.success ? Icons.check : Icons.delete,
                  color: Colors.white,
                  size: 50 * animation.value,
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
        child: Icon(widget.success ? Icons.check : Icons.delete),
      );
}

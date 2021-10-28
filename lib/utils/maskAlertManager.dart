import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:revolution/appRouter.dart';

class MaskAlertManager {
  static showMaskAlert({
    BuildContext context,
    IconData icon,
    Duration duration,
    String image,
    Color color,
  }) async {
    final _duration = duration ?? Duration(milliseconds: 1000);
    final overlayEntry = OverlayEntry(
      builder: (context) => MaskAlert(
        icon: icon,
        duration: _duration,
        image: image,
        color: color,
      ),
    );
    Overlay.of(context).insert(overlayEntry);
    Future.delayed(_duration, () => overlayEntry.remove());
  }
}

class MaskAlert extends StatefulWidget {
  MaskAlert({
    this.icon,
    this.duration,
    this.image,
    this.color,
  });

  final IconData icon;
  final Duration duration;
  final String image;
  final Color color;

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
    controller = AnimationController(duration: widget.duration, vsync: this)
      ..addStatusListener((status) {
        print(status);
        if (status == AnimationStatus.completed) {
          AppRouter.pop();
        }
      });
    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.4, 0.6),
      ),
    )..addListener(() {
        setState(() {});
      });

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
    return Container(
      child: IntrinsicHeight(
        child: Center(
          child: Container(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Opacity(
                opacity: 1 - animation.value,
                child: Container(
                  padding: EdgeInsets.all(10 * (animation.value + 1)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(.3),
                  ),
                  child: widget.image != null
                      ? Container(
                          child: SvgPicture.asset(
                            widget.image,
                            color: widget.color,
                            width: 60 * (animation.value + 1),
                            height: 60 * (animation.value + 1),
                          ),
                        )
                      : Icon(
                          widget.icon,
                          color: Colors.white,
                          size: 60 * (animation.value + 1),
                        ),
                ),
              ),
              child: child(),
            ),
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

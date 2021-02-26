import 'package:flutter/material.dart';

part 'custom_animated_list_view.dart';

enum CustomAnimationType { leftToRight, rightToLeft, topToBottom, bottomToTop }

class CustomAnimation extends StatefulWidget {
  final Widget widget;
  final CustomAnimationType customAnimationType;
  final Duration animationDuration;
  final AnimationController animationController;
  final bool playAnimation;
  final bool showWidgetWithoutAnimation;
  final Function onAnimationComplete;

  CustomAnimation({
    @required this.widget,
    this.customAnimationType,
    this.animationDuration = const Duration(milliseconds: 450),
    this.animationController,
    this.playAnimation = true,
    this.showWidgetWithoutAnimation = false,
    this.onAnimationComplete,
  }) : assert(playAnimation || animationController != null);

  @override
  State<StatefulWidget> createState() {
    return _CustomAnimationState();
  }
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  Animation<Offset> _offset;
  Animation<double> _opacityAnimation;
  AnimationController _controller;
  Animation _curve;

  @override
  void initState() {
    super.initState();

    if (widget.animationController != null) {
      _controller = widget.animationController;
    } else {
      _controller =
          AnimationController(duration: widget.animationDuration, vsync: this);
    }

    _curve = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.onAnimationComplete != null) {
          widget.onAnimationComplete();
        }
      }
    });

    Offset offset = Offset(1, 0);
    if (widget.customAnimationType == CustomAnimationType.leftToRight) {
      offset = Offset(-1, 0);
    } else if (widget.customAnimationType == CustomAnimationType.topToBottom) {
      offset = Offset(0, -1);
    } else if (widget.customAnimationType == CustomAnimationType.bottomToTop) {
      offset = Offset(0, 1);
    }

    if (widget.showWidgetWithoutAnimation) {
      _offset = Tween(begin: Offset(0, 0), end: Offset(0, 0)).animate(_curve);

      _controller.forward().whenComplete(() {
        if (widget.showWidgetWithoutAnimation) {
          _offset = Tween(begin: offset, end: Offset(0, 0)).animate(_curve);
        }
      });
    } else {
      _offset = Tween(begin: offset, end: Offset(0, 0)).animate(_curve);
      _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_curve);
    }

    if (widget.playAnimation && !widget.showWidgetWithoutAnimation) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return SlideTransition(
          position: _offset,
          child: _opacityAnimation == null
              ? widget.widget
              : Opacity(
                  opacity: _opacityAnimation.value,
                  child: widget.widget,
                ),
        );
      },
    );
  }
}

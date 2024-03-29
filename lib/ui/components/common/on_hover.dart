import 'package:flutter/material.dart';

class OnHoverTranslate extends StatefulWidget {
  const OnHoverTranslate({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<OnHoverTranslate> createState() => _OnHoverTranslateState();
}

class _OnHoverTranslateState extends State<OnHoverTranslate> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -6, 0);
    final transform = _isHovering ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => _mouseEnter(true),
      onExit: (event) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: transform,
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
  }
}

class OnHoverScale extends StatefulWidget {
  const OnHoverScale({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<OnHoverScale> createState() => _OnHoverScaleState();
}

class _OnHoverScaleState extends State<OnHoverScale> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.1);
    final transform = _isHovering ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => _mouseEnter(true),
      onExit: (event) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: transform,
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
  }
}

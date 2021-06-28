import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class BaseSwitcher extends StatefulWidget {
  bool open;
  ValueChanged<bool> onChanged;
  double? width;
  double? height;
  double? offset;
  Widget? openChild;
  Widget? closeChild;
  double? childOffset;
  Color? color;
  Color? openColor;
  Color? sliderColor;
  Widget? sliderChild;
  bool? enable;
  Color? shadowColor;
  Offset? shadowOffset;
  double? shadowBlur;

  BaseSwitcher({
    Key? key,
    required this.onChanged,
    this.open = false,
    this.width = 59.23,
    this.height,
    this.offset,
    this.childOffset,
    this.closeChild,
    this.openChild,
    this.color,
    this.openColor,
    this.sliderColor,
    this.sliderChild,
    this.enable = true,
    this.shadowColor,
    this.shadowOffset,
    this.shadowBlur = 0.0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BaseSwitcher();
  }
}

class _BaseSwitcher extends State<BaseSwitcher> {
  double? fixOffset;
  bool draging = false;
  double dragDxW = 10.0;

  @override
  void initState() {
    super.initState();
    fixOffset = widget.open
        ? widget.width! -
            (widget.offset ??
                    2.0 / 36.0 * ((widget.height ?? widget.width! * 0.608))) *
                2.0 -
            (widget.height ?? widget.width! * 0.608) * (32.52 / 36.0)
        : 0;
  }

  @override
  void didUpdateWidget(BaseSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);
    fixOffset = widget.open
        ? widget.width! -
            (widget.offset ??
                    2.0 / 36.0 * ((widget.height ?? widget.width! * 0.608))) *
                2.0 -
            (widget.height ?? widget.width! * 0.608) * (32.52 / 36.0)
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.height ?? widget.width! * 0.608;
    double circleSize = (height * (32.52 / 36.0));
    widget.offset = widget.offset ?? 2.0 / 36.0 * height;
    double childOffset = widget.childOffset ?? height / 5.0;
    widget.color = widget.color ?? Color(0xffcccccc);
    widget.openColor = widget.openColor ?? Color(0xffffc900);

    List<Widget> children = [];

    final showShadow = widget.shadowColor != null && widget.shadowBlur != 0;
    final background = AnimatedContainer(
      duration: Duration(milliseconds: 350),
      decoration: BoxDecoration(
        color: (widget.open ? widget.openColor : widget.color) ?? widget.color,
        borderRadius: BorderRadius.all(Radius.circular(height / 2.0)),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: widget.shadowColor!,
                  offset: widget.shadowOffset ?? Offset(0, 0),
                  blurRadius: widget.shadowBlur!,
                )
              ]
            : null,
      ),
      child: Container(
        width: widget.width,
        height: height,
      ),
    );
    children.add(background);

    Widget? showChild = widget.open ? widget.openChild : widget.closeChild;
    if (showChild != null) {
      showChild = Positioned(
        left: widget.open ? childOffset : null,
        right: widget.open ? null : childOffset,
        child: showChild,
      );
      children.add(showChild);
    }

    final slider = AnimatedContainer(
      margin: EdgeInsets.fromLTRB(widget.offset! + fixOffset!, 0, 0, 0),
      duration: Duration(milliseconds: 200),
      width: circleSize + (draging ? dragDxW : 0.0),
      child: Container(
        height: circleSize,
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.sliderColor ?? Color(0xffffffff),
            borderRadius: BorderRadius.all(Radius.circular(circleSize / 2.0))),
        child: widget.sliderChild,
      ),
    );
    children.add(slider);

    if (!widget.enable!) {
      final disableMask = Opacity(
        opacity: 0.6,
        child: Container(
          width: widget.width,
          height: height,
          decoration: BoxDecoration(
              color: Color(0xfff1f1f1),
              borderRadius: BorderRadius.all(Radius.circular(height / 2.0))),
        ),
      );
      children.add(disableMask);
    }

    return GestureDetector(
      onTap: widget.enable! ? _handleOnTap : null,
      onHorizontalDragEnd: widget.enable! ? _handleOnHorizontalDragEnd : null,
      onHorizontalDragUpdate:
          widget.enable! ? _handleOnHorizontalDragUpdate : null,
      onHorizontalDragCancel: widget.enable! ? _handleDragCancel : null,
      onHorizontalDragStart: widget.enable! ? _handleDragStart : null,
      child: Container(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: children,
        ),
      ),
    );
  }

  void _handleOnTap() {
    setState(() {
      widget.open = !widget.open;
      double height = widget.height ?? widget.width! * 0.608;
      double circleSize = (height * (32.52 / 36.0));
      if (widget.open) {
        fixOffset =
            widget.width! - widget.offset! - circleSize - widget.offset!;
      } else {
        fixOffset = 0;
      }
      widget.onChanged(widget.open);
    });
  }

  void _handleDragStart(DragStartDetails details) {
    setState(() {
      draging = true;
    });
  }

  void _handleOnHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      double height = widget.height ?? widget.width! * 0.608;
      double circleSize = (height * (32.52 / 36.0));
      fixOffset = fixOffset! + details.delta.dx;
      if (fixOffset! < 0) {
        fixOffset = 0;
      } else if (fixOffset! >
          widget.width! -
              widget.offset! -
              circleSize -
              (draging ? dragDxW : 0.0) -
              widget.offset!) {
        fixOffset = widget.width! -
            widget.offset! -
            circleSize -
            (draging ? dragDxW : 0.0) -
            widget.offset!;
      }
    });
  }

  void _handleOnHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      draging = false;
      double height = widget.height ?? widget.width! * 0.608;
      double circleSize = (height * (32.52 / 36.0));
      double center = (widget.width! -
              widget.offset! -
              circleSize -
              (draging ? dragDxW : 0.0) -
              widget.offset!) /
          2;
      bool cacheValue = widget.open;
      if (fixOffset! < center) {
        fixOffset = 0;
        widget.open = false;
      } else {
        fixOffset = center * 2;
        widget.open = true;
      }
      if (cacheValue != widget.open) {
        widget.onChanged(widget.open);
      }
    });
  }

  void _handleDragCancel() {
    setState(() {
      draging = false;
    });
  }
}

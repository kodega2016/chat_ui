import 'package:flutter/material.dart';

class KRoundedContainer extends StatelessWidget {
  final double borderRadius;
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double height;
  final double width;

  const KRoundedContainer({
    Key key,
    this.borderRadius = 6.0,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(10),
    this.child,
    this.height,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: child,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.grey[200],
            offset: Offset(0.4, 0.5),
          )
        ],
      ),
    );
  }
}

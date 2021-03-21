import 'package:flutter/material.dart';

class KRaisedBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final double height;
  final double borderRadius;

  const KRaisedBtn({
    Key key,
    this.onPressed,
    @required this.label,
    this.color,
    this.height = 40.0,
    this.borderRadius = 6.0,
  })  : assert(label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius))),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class KAvatar extends StatelessWidget {
  final String image;
  final double height;
  final double width;

  const KAvatar({
    Key key,
    @required this.image,
    this.height = 60.0,
    this.width = 60.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: height,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[100],
      ),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: image,
        alignment: Alignment.center,
        placeholder: (ctx, _) => Container(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}

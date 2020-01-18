import 'package:flutter/material.dart';

class MediaIcons extends StatelessWidget {
  final List<Color> clrs;
  final IconData iconData;
  final Function ifPressed;

  const MediaIcons({Key key, this.clrs, this.iconData, this.ifPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 45.0,
        width: 45.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(1.0,3.0),
                colors: clrs,
                tileMode: TileMode.clamp)),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: ifPressed,
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

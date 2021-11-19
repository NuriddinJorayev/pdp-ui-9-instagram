import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MinUserImage extends StatefulWidget {
  final image;
  final userName;
  final itemColor;


  const MinUserImage(this.image, this.userName, this.itemColor);

  @override
  _MinUserImageState createState() => _MinUserImageState();
}

class _MinUserImageState extends State<MinUserImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover
                  ),
                  shape: BoxShape.circle
                ),
              ),
              SizedBox(width: 10.0),
              Text(widget.userName, style: TextStyle(color: widget.itemColor, letterSpacing: 0.8),)
            ],
          ),
          Icon(Icons.more_horiz, color: widget.itemColor, size: 35.0)
        ],
      ),
    );
  }
}

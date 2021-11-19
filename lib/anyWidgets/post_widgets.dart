import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdpui9/anyWidgets/min_user_image.dart';
import 'package:pdpui9/anyWidgets/richText_widget.dart';

class PostWidget extends StatefulWidget {
  final String userName;
  final String userImage;
  final String feedImage;
  final bool isPhoto;
  final List<String> likedBy;
  final String feedComment;
  final String feedTime;
  final _itemColor;
  final _panelColor;

  const PostWidget(
      this.userName,
      this.userImage,
      this.feedImage,
      this.isPhoto,
      this.likedBy,
      this.feedComment,
      this.feedTime,
      this._itemColor,
      this._panelColor);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: widget._panelColor,
        child: Column(
          children: [
            // user image, username and more button panel
            SizedBox(height: 10.0),
            MinUserImage(widget.userImage, widget.userName, widget._itemColor),
            SizedBox(height: 10.0),
            Image(
              width: double.infinity,
              image: AssetImage(widget.feedImage),
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0),

            // like,comment,sent, bookmark buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 10.0),
                    Icon(FontAwesome.heart_o, color: widget._itemColor),
                    SizedBox(width: 15.0),
                    Icon(FontAwesome.comment_o, color: widget._itemColor),
                    SizedBox(width: 15.0),
                    Icon(FontAwesome.send_o, color: widget._itemColor),
                  ],
                ),
                Icon(FontAwesome.bookmark_o, color: widget._itemColor)
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: RichTextWidget(widget.isPhoto, widget.userName,
                    widget.likedBy, widget.feedComment, widget.feedTime, widget._itemColor))
          ],
        ));
  }
}

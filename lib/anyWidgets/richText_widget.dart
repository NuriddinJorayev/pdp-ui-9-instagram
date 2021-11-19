import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatefulWidget {
  final bool isPhoto;
  final String userName;
  final List<String> likedBy;
  final String comment;
  final String time;
  final _itemColor;

  const RichTextWidget(
    this.isPhoto,    this.userName,
    this.likedBy,    this.comment,
    this.time,      this._itemColor,
  );

  @override
  _RichTextWidgetState createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // @liked by panel
        widget.likedBy.isNotEmpty
            ? Row(
                children: [
                  _textWithOutStyle('Liked By '),
                  Container(
                    width: widget.likedBy.last.length >30 ? 150.0 : null,
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: widget.likedBy.last + " ",
                        style: TextStyle(
                            color: widget._itemColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  _textWithOutStyle('and '),
                  _textWithStyle(
                      " ${widget.likedBy.length} ${_likeSizeChecker(widget.likedBy.length)}"),
                ],
              )
            : Row(),
        SizedBox(height: 5.0),
        widget.comment.isNotEmpty
            ? Row(
                children: [
                  _textWithStyle(widget.userName + ' '),
                  _textWithOutStyle(widget.comment)
                ],
              )
            : Row(),
        SizedBox(height: 5.0),
        Row(
          children: [
            Text(
              widget.time,
              style: TextStyle(color: Colors.grey, fontSize: 10.0),
            )
          ],
        ),
        SizedBox(height: 5.0),
      ],
    );
  }

  // @ with TextStyle
  Widget _textWithStyle(String text) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          text: text,
          style: TextStyle(color: widget._itemColor, fontWeight: FontWeight.bold)),
    );
  }

  // @ without TextStyle
  Widget _textWithOutStyle(String text) {
    return RichText(
      text: TextSpan(text: text, style: TextStyle(color: widget._itemColor)),
    );
  }

  String _likeSizeChecker(int i) {
    if (i > 1) return "others";
    return "other";
  }
}

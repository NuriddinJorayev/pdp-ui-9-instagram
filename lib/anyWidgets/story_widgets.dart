import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatefulWidget {
  final name;
  final storyImage;
  final panelColor;
  final itemColor;

  const StoryWidget(this.name, this.storyImage, this.panelColor, this.itemColor);

  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0),
            padding: EdgeInsets.all(3.0),
            height: MediaQuery.of(context).size.width / 5.0,
            width: MediaQuery.of(context).size.width / 5.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFFFA300),
                      Color(0xFFF3B03A),
                      Color(0xFFF8337D),
                      Color(0xFFFF0060),
                    ])),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.panelColor,
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.storyImage), fit: BoxFit.cover),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[600]!, width: 1.5),
                    color: Colors.grey),
              ),
            ),
          ),
      SizedBox(height: 5.0),
      Container(
       width: (MediaQuery.of(context).size.width / 5.5),
        padding: EdgeInsets.symmetric(horizontal: 2.0),
        child: Center(child: Text(widget.name,
          overflow: TextOverflow.ellipsis, style: TextStyle(color:widget.itemColor),)),
      )
    ],
  );
}

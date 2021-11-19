import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdpui9/anyWidgets/post_widgets.dart';
import 'package:pdpui9/anyWidgets/story_widgets.dart';
import 'package:pdpui9/models/post.dart';
import 'package:pdpui9/models/story.dart';


class FeedPanel extends StatefulWidget {
  final _itemColor;
  final _panelColor;
  const FeedPanel(this._itemColor, this._panelColor);



  @override
  _FeedPanelState createState() => _FeedPanelState();
}

class _FeedPanelState extends State<FeedPanel> {

  List<Story> _StoryItems = [];
  List<Post> _PostItems = [];
  @override
  void initState() {
   _StoryItems = [
     Story("John wick", "assets/images/feed_1.jpeg", widget._panelColor,  widget._itemColor),
     Story("Jonson mark", "assets/images/feed_2.jpeg", widget._panelColor,  widget._itemColor),
     Story("Rihanna", "assets/images/feed_3.jpeg", widget._panelColor,  widget._itemColor),
     Story("James	Mary", "assets/images/feed_1.jpeg", widget._panelColor,  widget._itemColor),
     Story("Alford Manor House", "assets/images/feed_2.jpeg", widget._panelColor,  widget._itemColor),
   ];
   _PostItems = [
     Post(true, "John wick", "assets/images/user_1.jpeg",
         "assets/images/feed_1.jpeg", ["NuriddinJorayev19991213NuriddinJorayev19991213"], 'comment yozish joyi', "2 hour age"),

     Post(true, "Jonson mark", "assets/images/user_2.jpeg",
         "assets/images/feed_2.jpeg", ["Umidjon"], '', "2 hour age"),

     Post(true, "Rihanna", "assets/images/user_3.jpeg",
         "assets/images/feed_3.jpeg", [], 'comment yozish joyi', "2 hour age"),

     Post(true, "James	Mary", "assets/images/user_1.jpeg",
         "assets/images/feed_1.jpeg", ["Nigora"], 'comment yozish joyi', "2 hour age"),
   ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          color: widget._panelColor,
        child: ListView(
          children: [
            // @ story panel
            Container(
              height: MediaQuery.of(context).size.height / 5.5,
              width: double.infinity,
              color: widget._panelColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Stories", style: TextStyle(color: widget._itemColor),),
                        Text("Watch All", style: TextStyle(color: widget._itemColor),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:  _StoryItems.map((e) =>
                        StoryWidget(e.name, e.BackgroundImage, e.panelColor, e.itemColor)).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // @ feed panel builder place
           Column(children: _PostItems.map((e) =>
               PostWidget(e.userName, e.userImage, e.feedImage, e.isPhoto,
                   e.likedBy, e.feedComment, e.feedTime,
                   widget._itemColor, widget._panelColor)).toList(),)

          ],
        ),
      ),
    );
  }
}

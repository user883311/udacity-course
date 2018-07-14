import 'package:flutter/material.dart';
import '../styles.dart';
import '../feed_route/column_feed.dart';
import './search_bar.dart';

class FeedRoute extends StatelessWidget {
  const FeedRoute();
  // TODO: create a Menu Buttons widget and place it as a footer
  // Buttons: Explore, Places, Saved, History

  Widget build(BuildContext context) {
    // TODO: the appbar includes: Settings button to the left,
    // Wikipedia name as a title
    Widget footerMenu = Container(
      color: darkGrey,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.new_releases,
              color: white,
              size: buttonSize,
            ),
            Icon(
              Icons.place,
              color: white,
              size: buttonSize,
            ),
            Icon(
              Icons.bookmark,
              color: white,
              size: buttonSize,
            ),
            Icon(
              Icons.timer,
              color: white,
              size: buttonSize,
            ),
          ],
        ),
      ),
    );

    Widget appBar = PreferredSize(
      preferredSize: Size(1.0, 83.0),
      child: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(100.0, 100.0),
          child: SearchBar(),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.settings),
              Center(
                child: Text(
                  "WikipediA",
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
              // add a placeholder transparent icon to balance the title layout
              Icon(
                Icons.settings,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: new Material(
        color: Colors.black,
        child: ColumnFeed(),
      ),
      bottomNavigationBar: footerMenu,
    );
  }
}

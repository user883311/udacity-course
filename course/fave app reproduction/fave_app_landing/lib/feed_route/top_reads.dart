import 'package:flutter/material.dart';
import 'box_header.dart';
import '../styles.dart';

class TopReads extends StatelessWidget {
  const TopReads();
  // TODO: create a Daily Top Reads widget
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: Column(
        children: <Widget>[
          BoxHeader(
            icon: Icon(Icons.power),
            title: "Top Read on English Wikipedia",
            date: "Thursday, 26 June",
          ),
          TopReadsList(),
        ],
      ),
    );
  }
}

class TopReadsList extends StatelessWidget {
  const TopReadsList();
  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsetTen,
      // color: Colors.black,
      child: Column(
        
        children: <Widget>[
          TopReadListItem(
            rankNumber: 1,
            title: "2018 FIFA World Cup",
            subtitle: "2022 FIFA World Cup",
            linkToArticle: "",
          ),
          TopReadListItem(
            rankNumber: 2,
            title: "2018 FIFA World Cup",
            subtitle: "2022 FIFA World Cup",
            linkToArticle: "",
          ),
          TopReadListItem(
            rankNumber: 3,
            title: "2018 FIFA World Cup",
            subtitle: "2022 FIFA World Cup",
            linkToArticle: "",
          ),
        ],
      ),
    );
  }
}

class TopReadListItem extends StatelessWidget {
  final int rankNumber;
  final String title;
  final String subtitle;
  final String linkToArticle;

  const TopReadListItem({
    Key key,
    @required this.rankNumber,
    @required this.title,
    @required this.subtitle,
    @required this.linkToArticle,
  })  : assert(rankNumber != null),
        super(key: key);

  Widget build(BuildContext context) {
    return Material(
      textStyle: TextStyle(
          // color: Colors.white,
          ),
      child: Container(
        color: Colors.black,
        child: Row(
          children: <Widget>[
            RankNumberButton(
              rankNumber: rankNumber,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            // TODO: add image here
            // Image.asset("$key"),
          ],
        ),
      ),
    );
  }
}

class RankNumberButton extends StatelessWidget {
  final int rankNumber;
  const RankNumberButton({
    Key key,
    @required this.rankNumber,
  })  : assert(rankNumber != null),
        super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: Material(
          // TODO: make this a circle, with colorfulborder and transparent
          // background color.
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.greenAccent),
              borderRadius: BorderRadius.circular(999999.0)),
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.black,
            child: Text(
              rankNumber.toString(),
              // ????
              style: Theme.of(context).textTheme.button,
            ),
          )),
    );
  }
}

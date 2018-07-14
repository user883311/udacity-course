import 'package:flutter/material.dart';
// @required is defined in the meta.dart package
import 'package:meta/meta.dart';
import '../styles.dart';

class BoxHeader extends StatelessWidget {
  /* The box header is composed of a star icon
  aligned to the left, a title and a date. It is used in all
  Explore Feed containers: Featured Article, Topd Reads, etc.*/
  final Icon icon;
  final String title;
  final String date;

  const BoxHeader({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.date,
  })  : assert(icon != null),
        assert(title != null),
        assert(date != null),
        super(key: key);

  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsetTen,
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.grey,
            child: Icon(Icons.star),
          ),
          Container(
            margin: edgeInsetTen,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  date,
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

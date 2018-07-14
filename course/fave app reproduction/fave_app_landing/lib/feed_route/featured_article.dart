import 'package:flutter/material.dart';
import 'box_header.dart';
import '../styles.dart';

class FeaturedArticleContainer extends StatelessWidget {
  // TODO: create a Featured Article widget. It requires a
  // header, an image, and an article snippet
  const FeaturedArticleContainer();

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          BoxHeader(
            icon: Icon(Icons.star),
            title: "Featured article",
            date: "Friday, 27 June",
          ),
          ArticleImage(),
          ArticleText(),
        ],
      ),
    );
  }
}

class ArticleImage extends StatelessWidget {
  /* Full screen width image. */

  const ArticleImage();
  Widget build(BuildContext context) {
    return new Image.asset(
      'assets/images/dilo2.PNG',
      // height: 100.0,
      // width: 100.0,
    );
  }
}

class ArticleText extends StatelessWidget {
  const ArticleText();
  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsetTen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Dilophosaurus",
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            "Genus of reptiles (fossil)",
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum",
            style: Theme.of(context).textTheme.body1,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.bookmark_border,
                color: Colors.blue,
              ),
              Text(
                "Save for later",
                style: Theme.of(context).textTheme.body1.apply(
                      color: Colors.blue,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

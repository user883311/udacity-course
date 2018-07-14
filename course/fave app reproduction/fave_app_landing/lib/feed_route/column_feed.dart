import 'package:flutter/material.dart';
import './search_bar.dart';
import './featured_article.dart';
import 'top_reads.dart';

class ColumnFeed extends StatelessWidget {
  /* TODO: pile all of these widgets up in a column: Featured
  Article, Top Reads, etc. */
  const ColumnFeed();
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // SearchBar(),
        FeaturedArticleContainer(),
        TopReads(),
      ],
    );
  }
}

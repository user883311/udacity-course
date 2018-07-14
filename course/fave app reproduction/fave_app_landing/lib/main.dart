// replicate the landing page of the iPhone Wikipedia app
import 'package:flutter/material.dart';
import './styles.dart';
import './feed_route/feed_route.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wikipedia',
      // showPerformanceOverlay: true,
      theme: darkTheme,
      home: new FeedRoute(),
    );
  }
}


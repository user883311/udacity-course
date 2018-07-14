import 'package:flutter/material.dart';

// STYLES
Color searchBarGrey = Color.fromRGBO(39, 41, 45, 1.0);

class SearchBar extends StatelessWidget {
  const SearchBar();
  final String emptyField = "Search Wikipedia";
  final IconData emptyFieldIcon = Icons.search;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Material(
          // need this Material to have a border radius
          borderRadius: BorderRadius.circular(10.0),
          color: searchBarGrey,
          child: Container(
            padding: EdgeInsets.all(3.0),
            child: Row(
              // TODO: there should actually be an input text Field here,
              // not just a text widget.
              children: <Widget>[
                Icon(
                  Icons.search,
                  size: Theme.of(context).textTheme.caption.fontSize,
                ),
                Text(
                  emptyField,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          )),
    );
  }
}

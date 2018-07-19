import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'backdrop.dart';
import 'category.dart';
import 'category_tile.dart';
import 'unit.dart';
import 'unit_converter.dart';

Future<void> _retrieveLocalCategories() async {
  // Consider omitting the types for local variables. For more details on Effective
  // Dart Usage, see https://www.dartlang.org/guides/language/effective-dart/usage
  final json = DefaultAssetBundle
      .of(context)
      .loadString('assets/data/regular_units.json');
  final data = JsonDecoder().convert(await json);
  if (data is! Map) {
    throw ('Data retrieved from API is not a Map');
  }
  // TODO: Create Categories and their list of Units, from the JSON asset
  int categoryIndex = 0;
  for (var key in data.keys) {
    final List<Unit> units =
        data[key].map<Unit>((dynamic x) => Unit.fromJson(x)).toList();
    var category = Category(
      name: key,
      color: _baseColors[categoryIndex],
      iconLocation: Icons.cake,
      units: units,
    );
    setState(() {
      if (categoryIndex == 0) {
        _defaultCategory = category;
      }
      _categories.add(category);
      categoryIndex++;
    });
  }
}

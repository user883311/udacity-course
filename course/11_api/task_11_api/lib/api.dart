// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// TODO: Import relevant packages
import 'dart:async';
import 'dart:convert' show json, utf8;
// import 'package:http/http.dart';
import 'dart:io';
import 'unit.dart';
import 'category.dart';

/// The REST API retrieves unit conversions for [Categories] that change.
///
/// For example, the currency exchange rate, stock prices, the height of the
/// tides change often.
/// We have set up an API that retrieves a list of currencies and their current
/// exchange rate (mock data).
///   GET /currency: get a list of currencies
///   GET /currency/convert: get conversion from one currency amount to another
class Api {
  // TODO: Add any relevant variables and helper functions
  final String url = "flutter.udacity.com";
  final HttpClient httpClient = HttpClient();

  // TODO: Create getUnits()
  /// Gets all the units and conversion rates for a given category.
  ///
  /// The `category` parameter is the name of the [Category] from which to
  /// retrieve units. We pass this into the query parameter in the API call.
  ///
  /// Returns a list. Returns null on error.
  Future<List<Unit>> getUnits([String category]) async {
    final jsonResponse = await getJson(url, "/currency");
    if (jsonResponse == null || jsonResponse["units"] == null) {
      return null;
    }
    return jsonResponse["units"];
  }

  // TODO: Create convert()
  /// Given two units, converts from one to another.
  ///
  /// Returns a double, which is the converted amount. Returns null on error.
  Future<double> convert(
      String category, String fromUnit, String toUnit, double amount) async {
    try {
      final jsonResponse = await getJson(
          url, "/$category/convert?from=$fromUnit&to$toUnit&amount=$amount");
      if (jsonResponse["status"] != "ok" ||
          jsonResponse["conversion" == null]) {
        print("Error retrieving conversion. " + jsonResponse["message"]);
        return null;
      }
      return amount * jsonResponse["conversion"];
    } on Exception catch (e) {
      print("Error message: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>> getJson(String url, String unencodedPath,
      [Map queryParameters]) async {
    final uri = Uri.https(url, unencodedPath);
    try {
      final httpRequest = await httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.ok) {
        return null;
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      final jsonResponse = json.decode(responseBody);
      return jsonResponse;
    } on Exception catch (e) {
      print("Error message: $e");
      return null;
    }
  }
}

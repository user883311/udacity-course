// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';

import 'unit.dart';

const _padding = EdgeInsets.all(16.0);

/// [ConverterRoute] where users can input amounts to convert in one [Unit]
/// and retrieve the conversion in another [Unit] for a specific [Category].
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// This [Category]'s name.
  final String name;

  /// Color for this [Category].
  final Color color;

  /// Units for this [Category].
  final List<Unit> units;

  /// This [ConverterRoute] requires the name, color, and units to not be null.
  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  // TODO: Set some variables, such as for keeping track of the user's input
  // value and units
  double _inputValue;
  String _outputValue;
  Unit _inputUnit;
  Unit _outputUnit;
  List<DropdownMenuItem> _unitMenuItems;
  String _errorText = "Only numbers, dumbass!";
  bool _showValidationError = false;
  var textController = new TextEditingController();

  // TODO: Determine whether you need to override anything, such as initState()
  @override
  void initState() {
    super.initState();
    _createDropdownItems();
    _setDefaults();
    _updateConversion();
  }

  // TODO: Add other helper functions. We've given you one, _format()

  // Create a fresh list of dropdown items, given a list of Units
  void _createDropdownItems() {
    var _newItems = <DropdownMenuItem>[];
    for (var unit in widget.units) {
      _newItems.add(
        DropdownMenuItem(
          value: unit.name,
          child: Text(unit.name),
        ),
      );
      setState(() {
        _unitMenuItems = _newItems;
      });
    }
  }

  /// Sets the default values for the 'from' and 'to' [Dropdown]s.
  void _setDefaults() {
    setState(() {
      _inputValue = 1.0;
      _inputUnit = widget.units[0];
      _outputUnit = widget.units[1];
    });
  }

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  void _updateConversion() {
    setState(() {
      _outputValue =
          _format(_inputValue * _outputUnit.conversion / _inputUnit.conversion);
      print("conversion updated...");
    });
  }

  void _updateInputValue(String input) {
    setState(() {
      if (input == null || input.isEmpty) {
        _outputValue = "";
      } else {
        try {
          _inputValue = double.parse(input);
          _showValidationError = false;
          _updateConversion();
        } on Exception catch (e) {
          print("Error: $e");
          _showValidationError = true;
        }
      }
    });
  }

  void _updateInputUnit(dynamic unitName) {
    setState(() {
      _inputUnit = widget.units.firstWhere(
        (Unit unit) {
          return unit.name == unitName;
        },
        orElse: null,
      );
      print("iput Unit changed");
    });
    _updateConversion();
  }

  void _updateOutputUnit(dynamic u) {
    setState(() {
      _outputUnit = widget.units.firstWhere(
        (Unit unit) {
          return unit.name == u;
        },
        orElse: null,
      );
      _updateConversion();
    });
  }

  // var numericalInputFormatter = TextInputFormatter();

  @override
  Widget build(BuildContext context) {
    // TODO: Create the 'input' group of widgets. This is a Column that includes
    // includes the output value, and 'from' unit [Dropdown].
    final Widget input = Padding(
      padding: _padding,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              errorText: _showValidationError ? _errorText : null,
              hintText: "Type value here",
              labelText: "Input",
            ),
            keyboardType: TextInputType.number,
            onChanged: _updateInputValue,
          ),
          Container(
            child: DropdownButton(
              isDense: true,
              items: _unitMenuItems,
              onChanged: _updateInputUnit,
              value: _inputUnit.name,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[500],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            padding: _padding,
            width: 600.0,
          ),
        ],
      ),
    );

    // TODO: Create a compare arrows icon.
    Widget arrow = RotatedBox(
      child: Icon(
        Icons.compare_arrows,
        size: 40.0,
      ),
      quarterTurns: 1,
    );

    // TODO: Create the 'output' group of widgets. This is a Column that
    final Widget output = Padding(
      padding: _padding,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: _outputValue,
            ),
            keyboardType: TextInputType.number,
            onChanged: _updateInputValue,
            enabled: false,
          ),
          Container(
            child: DropdownButton(
              isDense: true,
              items: _unitMenuItems,
              onChanged: _updateOutputUnit,
              value: _outputUnit.name,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[500],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            padding: _padding,
            width: 600.0,
          ),
        ],
      ),
    );

    // TODO: Return the input, arrows, and output widgets, wrapped in
    return ListView(
      children: [
        input,
        arrow,
        output,
      ],
    );
  }
}

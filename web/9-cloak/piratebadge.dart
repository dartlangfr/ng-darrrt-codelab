// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math' show Random;

import 'package:angular/angular.dart';

import 'badge/badge_component.dart';
import 'filter/capitalize_filter.dart';
import 'rockandroll/rockandroll_directive.dart';

class PirateName {
  static final Random indexGen = new Random();

  static List names = [];
  static List appellations = [];

  String _firstName;
  String _appellation;

  PirateName({String firstName, String appellation}) {

    if (firstName == null) {
      _firstName = names.isEmpty ? '' : names[indexGen.nextInt(names.length)];
    } else {
      _firstName = firstName;
    }
    if (appellation == null) {
      _appellation = appellations.isEmpty ? '' : appellations[indexGen.nextInt(appellations.length)];
    } else {
      _appellation = appellation;
    }
  }

  String toString() => pirateName;

  String get pirateName => _firstName.isEmpty ? '' : '$_firstName the $_appellation';
}

@NgController(
    selector: '[bagdes]',
    publishAs: 'ctrl')
class BadgesController {
  PirateName _name = new PirateName(firstName: '');

  final Http _http;

  bool datasLoaded = false;

  BadgesController(this._http) {
    _loadData();
  }

  set name(String value) {
    _name = new PirateName(firstName: value);
  }

  String get name => _name._firstName;
  String get pirateName => _name.pirateName;

  generateName() {
    _name = new PirateName();
  }

  void _loadData() {
    datasLoaded = false;
    _http.get('piratenames.json').then((HttpResponse response) {
      PirateName.names = response.data['names'];
      PirateName.appellations = response.data['appellations'];
      datasLoaded = true;
    }, onError: (Object obj) {
      datasLoaded = false;
    });
  }
}

void main() {
  ngBootstrap(module: new Module()
    ..type(BadgesController)
    ..type(BadgeComponent)
    ..type(CapitalizeFilter)
    ..type(RockAndRoll)
    );
}


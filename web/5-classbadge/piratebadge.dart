// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math' show Random;

import 'package:angular/angular.dart';

import 'badge/badge_component.dart';

@MirrorsUsed(override:'*')
import 'dart:mirrors';

class PirateName {
  static final Random indexGen = new Random();

  static final List names = [
    'Anne', 'Mary', 'Jack', 'Morgan', 'Roger',
    'Bill', 'Ragnar', 'Ed', 'John', 'Jane' ];
  static final List appellations = [
    'Wise', 'Stalwart', 'Axe',
    'Brave', 'Noble', 'Strong'];

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
    selector: '[badges]',
    publishAs: 'ctrl')
class BadgesController {
  PirateName _name = new PirateName(firstName: '');

  set name(String value) {
    _name = new PirateName(firstName: value);
  }

  String get name => _name._firstName;
  String get pirateName => _name.pirateName;
  bool get inputIsNotEmpty => !name.trim().isEmpty;
  String get label => inputIsNotEmpty ? "Arrr! Write yer name!" : "Aye! Gimme a name!";

  generateName() {
    _name = new PirateName();
  }
}

void main() {
  ngBootstrap(module: new Module()
    ..type(BadgesController)
    ..type(BadgeComponent));
}

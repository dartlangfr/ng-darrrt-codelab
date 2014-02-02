// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math' show Random;

import 'package:angular/angular.dart';

@MirrorsUsed(override:'*')
import 'dart:mirrors';

import 'service/names_service.dart';
import 'badge/badge_component.dart';
import 'filter/capitalize_filter.dart';
import 'rockandroll/rockandroll_directive.dart';

class PirateName {
  String firstName;
  String appellation;

  PirateName(this.firstName, this.appellation);

  PirateName.blank() : firstName = '', appellation = '';

  String toString() => pirateName;

  String get pirateName => firstName.isEmpty ? '' : '$firstName the $appellation';
}

@NgController(
    selector: '[badges]',
    publishAs: 'ctrl')
class BadgesController {
  static final Random indexGen = new Random();

  PirateName _name = new PirateName.blank();

  final NamesService _names;

  bool datasLoaded = false;

  BadgesController(this._names) {
    // TODO proper error handling.
    _names.load().then((_) {
      datasLoaded = true;
    })
    .catchError((e) {
      datasLoaded = false;
    });
  }

  set name(String value) {
    _name = new PirateName(value, _names.randomAppellation());
  }

  String get name => _name.firstName;
  String get pirateName => _name.pirateName;
  bool get inputIsNotEmpty => !name.trim().isEmpty;
  String get label => inputIsNotEmpty ? "Arrr! Write yer name!" : "Aye! Gimme a name!";

  generateName() {
    _name = new PirateName(_names.randomName(), _names.randomAppellation());
  }

}

void main() {
  ngBootstrap(module: new Module()
    ..type(BadgesController)
    ..type(BadgeComponent)
    ..type(CapitalizeFilter)
    ..type(NamesService)
    ..type(RockAndRoll)
    );
}

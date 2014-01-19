// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'badge/badge_component.dart';

@NgController(
    selector: '[bagdes]',
    publishAs: 'ctrl')
class BadgesController {
  String name = '';

  bool get inputIsNotEmpty => !name.trim().isEmpty;
  String get label => inputIsNotEmpty ? "Arrr! Write yer name!" : "Aye! Gimme a name!";

  generateName() {
    name = 'Anne Bonney';
  }
}

void main() {
  ngBootstrap(module: new Module()
    ..type(BadgesController)
    ..type(BadgeComponent));
}

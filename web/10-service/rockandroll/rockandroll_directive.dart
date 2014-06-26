library tooltip;

import 'dart:html' as dom;

import 'package:angular/angular.dart';

@NgDirective(
    selector: '[rock-and-roll]'
)
class RockAndRoll {
  dom.Element element;
  Scope scope;

  RockAndRoll(this.element, this.scope) {
    element
      ..onMouseEnter.listen((_) => element.classes.toggle('rock-and-roll'))
      ..onMouseLeave.listen((_) => element.classes.toggle('rock-and-roll'));
  }
}

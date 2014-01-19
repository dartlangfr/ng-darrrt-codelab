## 7. Create a directive.
> **Goal**: As a developer, I want to change badge css style when the user drag his mouse over on it .

_**Keywords**: directive_

> At a high level, directives are markers on a DOM element (such as an attribute, element name, or CSS class) that tell AngularDart's HTML compiler to attach a specified behavior to that DOM element or even transform the DOM element and its children.

1. Create a file `rockandroll/rockandroll_directive.dart`.
 - Paste the following content:

    ```Dart
    library tooltip;

    import 'dart:html' as dom;

    import 'package:angular/angular.dart';

    class RockAndRoll {
      dom.Element element;
      Scope scope;
    
      RockAndRoll(this.element, this.scope) {
        element
          ..onMouseEnter.listen((_) => element.classes.toggle('rock-and-roll'))
          ..onMouseLeave.listen((_) => element.classes.toggle('rock-and-roll'));
      }
    }
    ``` 
 - Add the annotation on `RockAndRoll` class:
 
    ```Dart
    @NgDirective(
      selector: '[rock-and-roll]'
    )
    class RockAndRoll {
    ``` 
 > This annotation tells Angular that the class `RockAndRoll` is an Angular Directive. 
 The required `selector` field defines the CSS selector that will trigger the Controller. It can be any valid CSS selector   which does not cross element boundaries.
    
2. Open `piratebadge.dart`.
 - Add import to this directive:

    ```Dart
    import 'rockandroll/rockandroll_directive.dart';
    ```
 - Add the `RockAndRoll` class in the module declaration in `main` function:

    ```Dart
    ngBootstrap(module: new Module()
      ..type(BadgesController)
      ..type(BadgeComponent)
      ..type(RockAndRoll)
    );
    ```
3. Open `piratebadge.html` and add the `rock-and-roll` tag to button:

    ```Dart
    <badge name="{{ctrl.pirateName}}" style='float: left; margin-left: 20px;' rock-and-roll></badge>
    ```
4. Run `piratebadge.html` and drag your mouse over badge.   
    
    
     
## [Home](../README.md) | [< Previous](step-6.md) | [Next >](step-8.md)

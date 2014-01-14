## 3.b. Use a class as model
> **Goal**: As a developper, I want to use a class object as model

_**Keywords**: class_

1. (Re)Create a PirateName class
 - Copy and paste the following code in `piratebadge.dart`:

    ```Dart
    import 'dart:math' show Random;
    
    class PirateName {
      static final Random indexGen = new Random();
    
      static final List names = [
                                 'Anne', 'Mary', 'Jack', 'Morgan', 'Roger',
                                 'Bill', 'Ragnar', 'Ed', 'John', 'Jane' ];
      static final List appellations = [
                                        'Black','Damned', 'Jackal', 'Red', 'Stalwart', 'Axe',
                                        'Young', 'Old', 'Angry', 'Brave', 'Crazy', 'Noble'];
    
      String _firstName;
      String _appellation;
    
      PirateName({String firstName, String appellation}) {
    
        if (firstName == null) {
          _firstName = names[indexGen.nextInt(names.length)];
        } else {
          _firstName = firstName;
        }
        if (appellation == null) {
          _appellation = appellations[indexGen.nextInt(appellations.length)];
        } else {
          _appellation = appellation;
        }
      }
    
      String toString() => pirateName;
    
      String get pirateName => _firstName.isEmpty ? '' : '$_firstName the $_appellation';
    }
    ```
2. Update the `BadgesController`
 - In `piratebadge.dart`, add a new private field `PirateName _name` in `BadgesController` class

    ```Dart
    class BadgesController {
      // ...
      PirateName _name = new PirateName(firstName: '');
      // ...
    }
    ```
 - Add `name` getter/setter and `pirateName` getter

    ```Dart
    class BadgesController {
      // ...
      String get name => _name._firstName;
      set name(String value) {
        _name = new PirateName(firstName: value);
      }
    
      String get pirateName => _name.pirateName;
      // ...
    }
    ```
 > Data binding on getters and setters is possible and we are taking advantage of it.
 - Update `generateName()` method to create a new `PirateName` instance.

    ```Dart
    class BadgesController {
      // ...
      generateName() {
        _name = new PirateName();
      }
      // ...
    }
    ```
2. Update data bindings
 - In `piratebadge.html`, update the data binding in the `badge` tag

    ```HTML
    <badge name="{{ctrl.pirateName}}" style='float: left; margin-left: 20px;'></badge>
    ```
 > The other data bindings are still valid, the syntax is the same to bind to a field or to a getter/setter

## [Home](../README.md) | [< Previous](step-3b.md) | [Next >](step-5.md)

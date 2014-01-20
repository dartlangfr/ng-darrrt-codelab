## 6. Read names from JSON-encoded file
> **Goal**: In this step, you change the `PirateName` and the `BadgesController` classes to get the list of names and appellations from a JSON file. This gives you a chance to add more names and appellations to the program.

_**Keywords**: HTTP Request, Dependency Injection_

1. (Re)Create piratenames.json
 - Use **File > New File…** to create a JSON-encoded file named `piratenames.json` with the following content.  
   Put the file in `1-blankbadge` alongside the Dart and HTML files you've been editing.

    ```JSON
    { "names": [ "Anne", "Bette", "Cate", "Dawn",
            "Elise", "Faye", "Ginger", "Harriot",
            "Izzy", "Jane", "Kaye", "Liz",
            "Maria", "Nell", "Olive", "Pat",
            "Queenie", "Rae", "Sal", "Tam",
            "Uma", "Violet", "Wilma", "Xana",
            "Yvonne", "Zelda",
            "Abe", "Billy", "Caleb", "Davie",
            "Eb", "Frank", "Gabe", "House",
            "Icarus", "Jack", "Kurt", "Larry",
            "Mike", "Nolan", "Oliver", "Pat",
            "Quib", "Roy", "Sal", "Tom",
            "Ube", "Val", "Walt", "Xavier",
            "Yvan", "Zeb"],
      "appellations": [ "Awesome", "Black", "Captain", "Damned",
            "Even", "Fighter", "Great", "Hearty",
            "Irate", "Jackal", "King", "Lord",
            "Mighty", "Noble", "Old", "Powerful",
            "Quick", "Red", "Stalwart", "Tank",
            "Ultimate", "Vicious", "Wily", "aXe",
            "Young", "Zealot",
            "Angry", "Brave", "Crazy", "Damned",
            "Eager", "Fool", "Greedy", "Hated",
            "Idiot", "Jinxed", "Kind", "Lame",
            "Maimed", "Naked", "Old", "Pale",
            "Queasy", "Rat", "Sandy", "Tired",
            "Ugly", "Vile", "Weak", "Xeric",
            "Yellow", "Zesty"]}  
    ```
2. Edit piratebadge.dart
 - Add an import to the top of the file.

    ```Dart
    import 'dart:async' show Future;
    ```
 > - The dart:async library provides for asynchronous programming.
 > - A Future provides a way to get a value in the future. (For JavaScript developers: Futures are similar to Promises.)
 - In `PirateName` class, replace the `names` and `appelations` lists with these static, empty lists:

    ```Dart
    class PirateName {
      // ...
      static List names = [];
      static List appellations = [];
      // ...
    }
    ```
 > - Be sure to remove final from these declarations.
 > - [] is equivalent to new List().
 > - A List is a generic type—a List can contain any kind of object. If you intend for a list to contain only strings, you can declare it as List<String>.
 - In `BadgesController` class, add a private field `Http _http`:

    ```Dart
    class BadgesController {
      // ...
      final Http _http;
      // ...
    }
    ```
 > - The `Http` service facilitates communication with the remote HTTP servers.
 - Add a constructor to initialize `_http`:

    ```Dart
    class BadgesController {
      // ...
      BadgesController(this._http);
      // ...
    }
    ```
 > - An instance of the `Http` service is automatically injected by Angular
 - Add a private function `_loadData`:

    ```Dart
    class BadgesController {
      // ...
      Future _loadData() {
        return _http.get('piratenames.json').then((HttpResponse response) {
          PirateName.names = response.data['names'];
          PirateName.appellations = response.data['appellations'];
        });
      }
      // ...
    }
    ```
 > - `get` is a shortcut method for GET requests.
 > - The code uses a Future to perform the GET asynchronously.
 > - The callback function for .then() is called when the Future completes successfully.
 > - When the Future completes successfully, the pirate names and appelations are read from the response's data. The response's data is directly transformed as a `Map` object.
 > - `_loadData` returns the Future so the controller has the opportunity to do something after the file is read.
- Then, in the constructor, add the code to get the names from the JSON file, handling both success and failure.

    ```Dart
    class BadgesController {
      // ...
      bool datasLoaded = false;
      
      BadgesController(this._http) {
        _loadData().then((_) {
          datasLoaded = true;
        }, onError: (_) {
          datasLoaded = false;
        });
      }
      // ...
    }
    ```
 > - Call the `_loadData()` function, which returns a Future.
 > - When the Future successfully completes, the `then()` callback function is called.
 > - Using underscore (`_`) as a parameter name indicates that the parameter is ignored.
 > - The callback function enables the UI.
 > - If the Future encounters an error the `onError` callback function is called and the program leaves the UI disabled.
 > - The callback functions for `then()` and `onError` are defined inline.
3. Edit piratebadge.html    
 - Enable `inputName` and the `button` only when data is loaded:

    ```HTML
    ...
      <div>
        <input type="text" id="inputName" maxlength="15" ng-model="ctrl.name" ng-disabled="!ctrl.datasLoaded">
      </div>
      <div>
        <button ng-click="ctrl.generateName()" ng-disabled="!ctrl.datasLoaded || ctrl.inputIsNotEmpty">{{ctrl.label}}</button>
      </div>
    ...
    ```
 > - If the expression in `ng-disabled` is truthy, then special attribute "disabled" will be set on the element
 > - When `datasLoaded` in `BadgesController` is false, the input and button elements are disabled.


### Learn more about
 - [Introducing the Http service](https://github.com/angular/angular.dart.tutorial/wiki/Introducing-filters-and-services) 

### Problems?
Check your code against the files in [6-piratebadge_json](../web/6-piratebadge_json).
- [piratebadge.html](../web/6-piratebadge_json/piratebadge.html)
- [piratebadge.dart](../web/6-piratebadge_json/piratebadge.dart)

## [Home](../README.md) | [< Previous](step-5.md) | [Next >](step-7.md)

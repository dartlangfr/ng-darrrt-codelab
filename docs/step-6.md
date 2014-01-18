## 6. Read names from JSON-encoded file
> **Goal**: In this step, you change the `PirateName` and the `BadgesController` classes to get the list of names and appellations from a JSON file. This gives you a chance to add more names and appellations to the program.

_**Keywords**: HTTP Request, Dependency Injection_

1. (Re)Create piratenames.json
 - Use **File > New File…** to create a JSON-encoded file named `piratenames.json` with the following content.  
   Put the file in `1-blankbadge` alongside the Dart and HTML files you�ve been editing.

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
 - In `PirateName` class, replace the `names` and `appelations` lists with these static, empty lists:

    ```Dart
    class PirateName {
      // ...
      static List names = [];
      static List appellations = [];
      // ...
    }
    ```
 - In `BadgesController` class, add a private field `Http _http`:

    ```Dart
    class PirateName {
      // ...
      final Http _http;
      // ...
    }
    ```
 > - The `Http` service facilitates communication with the remote HTTP servers.
 - Add a constructor to initialize `_http`:

    ```Dart
    class PirateName {
      // ...
      BadgesController(this._http);
      // ...
    }
    ```
 > - An instance of the `Http` service is automatically injected by Angular
 - Add a private function `_loadData`:

    ```Dart
    class PirateName {
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
 > - **TODO**
 - Then, in the constructor, add the code to get the names from the JSON file, handling both success and failure.

    ```Dart
    class PirateName {
      // ...
      bool datasLoaded = false;
      
      BadgesController(this._http) {
        _loadData().then((HttpResponse response) {
          datasLoaded = true;
        }, onError: (Object obj) {
          datasLoaded = false;
        });
      }
      // ...
    }
    ```
3. Edit piratebadge.html    
 - Enable `inputName` and the `button` only when data is loaded:

    ```HTML
    ...
      <div>
        <input type="text" id="inputName" maxlength="15" ng-model="ctrl.name" ng-disabled="!ctrl.datasLoaded">
      </div>
      <div>
        <button ng-click="ctrl.generateName()" ng-disabled="!ctrl.datasLoaded || ctrl.name.trim().isNotEmpty">Aye! Gimme a name!</button>
      </div>
    ...
    ```
 > - **TODO**

<a name="hints"></a>
> **Hints:**
> 
> - [Introducing the Http service](https://github.com/angular/angular.dart.tutorial/wiki/Introducing-filters-and-services) 

## [Home](../README.md) | [< Previous](step-5.md) | [Next >](step-7.md)

## 5. Read names from JSON-encoded file
> **Goal**: As a developper, I load pirates names from a JSON file.

_**Keywords**: http, injection, disable_

1. Use File > New File… to create a JSON-encoded file named `piratenames.json` with the following content. Put the file in `1-blankbadge` alongside the Dart and HTML files you’ve been editing.

    ```js
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
2. Open `piratebadge.dart`.
 - Replace the `names` and `appellations` lists from `PirateName` class with these static, empty lists:

    ```Dart
    static List names = [];
    static List appellations = [];
    ```
 - Modify constructor to return empty name and appellations when `names` and `appellations` lists are not yet loaded.

    ```Dart
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
    ```
 - In `BadgesController`, add a `Http` field named `_http`.

    ```Dart
    class BadgesController {
      PirateName _name = new PirateName(firstName: '');

      final Http _http;
    ```
> Angular provides a built in service called the Http Service that handles making HTTP requests to the server.
 - Add a constructor which injected the `_http` instance:
 
    ```Dart
    BadgesController(this._http);
    ```
 - Add a `datasLoaded` boolean :

    ```Dart  
   final Http _http;
   bool datasLoaded = false;
   ```
 - Add a private method `_loadData()`:

    ```Dart
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
    ``` 
 - Call this method from constructor:

    ```Dart
    BadgesController(this._http) {
      _loadData();
    }
    ```
3. Open `piratebadge.html`.
 - Disable input name when data are not loaded:
    
    ```HTML
    <input type="text" id="inputName" maxlength="15" ng-model="ctrl.name" ng-disabled="!ctrl.datasLoaded">
    ```
 - Disable button when data are not loaded or when input text is empty:

   ```HTML
   <button ng-click="ctrl.generateName()" ng-disabled="!ctrl.datasLoaded || ctrl.name.trim().isNotEmpty">Aye! Gimme a name!</button>
   `` 
     
    
<a name="hints"></a>
> **Hints:**
> 
> - [Introducing the Http service](https://github.com/angular/angular.dart.tutorial/wiki/Introducing-filters-and-services) 
 

## [Home](../README.md) | [< Previous](step-4.md) | [Next >](step-7.md)

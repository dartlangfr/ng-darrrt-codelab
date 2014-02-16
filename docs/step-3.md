## 3. Add a generate name button.
> **Goal**: As a user I want to put the name 'Anne Bonney' when I click on a generate button.

_**Keywords**: controller, module, click event_

1. Open `piratebadge.dart`.
 - Create empty class `BadgesController` with a `name` field :

    ```Dart
    class BadgesController {
    
      String name = '';

      BadgesController();

    }
    ``` 
 - Add a `NgController` annotation top of this class :

    ```Dart
    @NgController(
       selector: '[badges]',
       publishAs: 'ctrl')
    class BadgesController {   
    ```

  <blockquote>
This annotation tells Angular that the class <code>BadgesController</code> is an Angular Controller.<br>
The required <code>selector</code> field defines the CSS selector that will trigger the Controller. It can be any valid CSS selector which does not cross element boundaries.<br>
The <code>publishAs</code> field specifies that the Controller instance should be assigned to the current scope under the name specified.
  </blockquote>
 - Modify `main` method to create a new module.

    ```Dart
    void main() {
      ngBootstrap(module: new Module()..type(BadgesController));
    }
    ```

  <blockquote>
Inside the ngBootstrap method, a new AngularModule is created. The AngularModule provides all of Angular’s built in services  and directives. Your app’s module is added to the list of modules that Angular loads.
  </blockquote>
 - In class `BadgesController`, add an `inputIsNotEmpty` getter, a `label` getter and a `generateName` method :

    ```Dart
    bool get inputIsNotEmpty => !name.trim().isEmpty;
  	String get label => inputIsNotEmpty ? "Arrr! Write yer name!" : "Aye! Gimme a name!";
      
    generateName() {
      name = 'Anne Bonney';
    }
    ```

2. Open `piratebadge.html`. 
 - Add `badges` (the controller selector name) on the `<body>` element:

    ```HTML
    <body badges>
    ```
 - Add the `button` tag below the input field

    ```HTML
    <div class="widgets">
      <div>
        <input type="text" id="inputName" maxlength="15" ng-model="name">
      </div>
      <div>
        <button ng-click="ctrl.generateName()">{{ctrl.label}}</button>
      </div>
    </div>
    ```

  <blockquote>
<code>ng-click</code> is a built in Angular Directive that allows you to specify custom behavior when any element is clicked. In our example, it invokes the generateName() method on the controller.<br>
<code>{{ctrl.label}}</code> show you that a mustache can refer to a getter.
  </blockquote>
 - Update data binding : replace `name` by `ctrl.name` to use name from controller.

    ```HTML
    <input type="text" id="inputName" maxlength="15" ng-model="ctrl.name">
    ```
    
    ```HTML
    <span id="badgeName">{{ctrl.name}}</span>
    ```
 - Add a `ng-disabled` directive on the button tag who disable it when the input field will be not empty.
 
 	```HTML
    <button ng-click="ctrl.generateName()" ng-disabled="ctrl.inputIsNotEmpty">
    	{{ctrl.label}}
    </button>
    ```
    
 > `ng-disabled`, like the `ng-click` directive, is a built-in AngularDart directive. It is used to enable or disable an element according to the value of a boolean expression. In our case we test that the controller's `name` property is not empty after we have trimmed it.

3. Run `piratebadge.html` and click on button.

### Problems?
Check your code against the files in [3-buttonbadge](../web/3-buttonbadge).
- [piratebadge.html](../web/3-buttonbadge/piratebadge.html)
- [piratebadge.dart](../web/3-buttonbadge/piratebadge.dart)

## [Home](../README.md) | [< Previous](step-2.md) | [Next >](step-4.md)

## 2. Add a generate name button.
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
       selector: '[bagdes]',
       publishAs: 'ctrl')
    class BadgesController {   
    ````

 > This annotation tells Angular that the class `BadgesController` is an Angular Controller. 
 The required `selector` field defines the CSS selector that will trigger the Controller. It can be any valid CSS selector   which does not cross element boundaries.
 The `publishAs` field specifies that the Controller instance should be assigned to the current scope under the name specified
 - Modify `main` method to create a new module.

    ```Dart
    void main() {
      ngBootstrap(module: new Module()..type(BadgesController));
    }
    ``` 
    
 > Inside the ngBootstrap method, a new AngularModule is created. The AngularModule provides all of Angular’s built in services  and directives. Your app’s module is added to the list of modules that Angular loads.
 - In class `BadgesController`, add a `generateName` method :

    ```Dart  
    generateName() {
      name = 'Anne Bonney';
    }
    ```

2. Open `piratebadge.html`. 
 - Add `bagdes` (the controller selector name) on the `<body>` element:

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
        <button ng-click="ctrl.generateName()">Aye! Gimme a name!</button>
      </div>
    </div>
    ```

 > `ng-click` is a built in Angular Directive that allows you to specify custom behavior when any element is clicked. In our example, it invokes the generateName() method on the controller, passing it the recipe property from the view
 - Update data binding : replace `name` by `ctrl.name` to use name from controller.

    ```HTML
    <input type="text" id="inputName" maxlength="15" ng-model="ctrl.name">
    ```
    
    ```HTML
    <span id="badgeName">{{ctrl.name}}</span>
    ```

3. Run `piratebadge.html` and click on button.


## [Home](../README.md) | [< Previous](step-1.md) | [Next >](step-3b.md)

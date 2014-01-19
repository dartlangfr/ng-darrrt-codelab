## 2. Set the text in badge with the input text.
> **Goal**: As a user I can modify the text of the badge with the input field.

_**Keywords**: binding, scope, model_

-----------------------------
> **Note**: Throughout this code lab, continue to edit the files in 1-blankbadge. You can use the files in the other directories to compare to your code or to recover if you get off track.

-----------------------------

1. Open `web/1-blankbadge/piratebadge.html`. Add `ng-app` on the `<html>` element:

    ```HTML
    <html ng-app>
    ```

	>The `ng-app` Directive can be placed on any element, and tells Angular which element is the root element of the application. Anything inside of this element is part of the page template managed by Angular. Unless you have a reason for Angular to manage only part of the app, it is recommended to put the `ng-app` Directive on the HTML element because it is the outermost tag.

2. Open `web/1-blankbadge/piratebadge.dart`. Add `ngBootstrap()` to the main content to bootstrap our application :

    ```Dart
	import 'package:angular/angular.dart';
	
	void main() {
	  ngBootstrap();
	}
    ```

3. Bind the `input` to the badge content:
 - Set `{{name}}` as content within the `badgeName` `<span>`

    ```HTML
    <span id="badgeName">{{name}}</span>
    ```
 - Add the `<input>` tag to the HTML code within the `widgets` `<div>`

    ```HTML
    <div>
      <input type="text" id="inputName" maxlength="15" ng-model="name">
    </div>
    ```

 > Notice that on the input element, we find a Directive called `ng-model`. The value of the model object is displayed in the view using the Angular expression `{{name}}`. 

4. Run `web/1-blankbadge/piratebadge.html` and try to modify the input content. Notice how the view is updated in real time whenever the model changes. This is called _Two Way Data Binding_. Angular listens for changes to the model and updates the view to reflect those changes.

### Learn more about
 - [How Angular does MVC](https://github.com/angular/angular.dart.tutorial/wiki/Creating-your-first-Angular-app#how-angular-does-mvc)

### Problems?
Check your code against the files in [2-inputnamebadge](../web/2-inputnamebadge).
- [piratebadge.html](../web/2-inputnamebadge/piratebadge.html)
- [piratebadge.dart](../web/2-inputnamebadge/piratebadge.dart)

## [Home](../README.md) | [< Previous](step-1.md) | [Next >](step-3.md)

## 4. Create a badge component.
> **Goal**: As a developer I can use a `<badge>` tag to put a badge anywhere.

_**Keywords**: component, ShadowDOM_

1. Create a `badge` folder in your work directory that will host all our component files.
2. Create a file `badge/badge_component.html` and move the HTML corresponding to the badge in this new file:
  
    ```HTML
    <div class="badge">
      <div class="greeting">
        Arrr! Me name is
      </div>
      <div class="name">
        <span id="badgeName">{{cmp.name}}</span>
      </div>
    </div>
    ```

3. Create a file `badge/badge_component.css` that will contain the styles for the badge component:

    ```CSS
    .badge {
      border: 2px solid brown;
      border-radius: 1em;
      background: red;
      font-size: 14pt;
      width: 14em;
      height: 7em;
      text-align: center;
      white-space: nowrap;
      overflow: hidden;
    }
    .greeting {
      color: white;
      font-family: sans-serif;
      padding: 0.5em;
    }
    .name {
      color: black;
      background: white;
      font-family: "Marker Felt", cursive;
      font-size: 25pt;
      padding-top: 1.0em;
      padding-bottom: 0.7em;
      height: 16px;
    }
    ```

4. Create a file `badge/badge_component.dart`.

    ```Dart
    library badge;
    
    import 'package:angular/angular.dart';
    
    @NgComponent(
        selector: 'badge',
        templateUrl: 'badge/badge_component.html',
        cssUrl: 'badge/badge_component.css',
        publishAs: 'cmp'
    )
    class BadgeComponent {
      @NgAttr('name')
      String name;
    }
    ```
 >#### `templateUrl` and `cssUrl`
 >Since Components are self contained, they need to know what HTML template and CSS to use for their view. Components do not use the HTML of your app. They have their own.
 >#### `map`
 >The `name` field of the class is marked with `@NgAttr`, which specifies that the field is to be mapped to DOM attribute.
5. In `piratebadge.html` replace the HTML code of badge with the new `<badge>`:

    ```HTML
    <badge name="{{ctrl.name}}" style='float: left; margin-left: 20px;'></badge>
    ```

6. Register the new component. In `piratebadge.dart`:
 - Add an import for the component library:

    ```Dart
    import 'badge/badge_component.dart';
    ```
 - Add the component type to the module:

    ```Dart
    void main() {
      ngBootstrap(module: new Module()
        ..type(BadgesController)
        ..type(BadgeComponent));
    }
    ```

7. Run your application.

**Bonus** : try to add several badges on your page.

### Learn more about
 - [Increasing code reuse through Components](https://github.com/angular/angular.dart.tutorial/wiki/Increasing-code-reuse-through-Components)
 - [Shadow DOM](http://www.w3.org/TR/shadow-dom/)

### Problems?
Check your code against the files in [4-extractcomponent](../web/4-extractcomponent).
- [piratebadge.html](../web/4-extractcomponent/piratebadge.html)
- [piratebadge.dart](../web/4-extractcomponent/piratebadge.dart)

## [Home](../README.md) | [< Previous](step-3.md) | [Next >](step-5.md)

## 7. Capitalize the name on the badge.
> **Goal**: Using a filter to modify the datas provided.

_**Keywords**: filter_

>Filters let you change how your model data is displayed in the view without changing the model data itself. They do things like allow you to show parts of the model data, or display data in a particular format. You can also use Angular’s custom filters feature to create your own filters to do anything you want.

1. Create a file `filter/capitalize_filter.dart` and paste the following content:
  
    ```DART
    library category_filter;
    
    import 'package:angular/angular.dart';
    
    @NgFilter(name: 'capitalize')
    class CapitalizeFilter {
      call(String name) {
        if (name == null || name.isEmpty) return '';
        return name[0].toUpperCase() + name.substring(1);
      }
    }
    ```
 >To create a custom filter in Angular, just create a simple Dart class that has a call method with the following signature:
 >
 >`call(valueToFilter, optArg1, optArg2);`

2. To use this filter we need to register it. In `piratebadge.dart`:
 - Add the import:

    ```DART
    import 'filter/capitalize_filter.dart';
    ```
 - Add the type to the module definition:

    ```DART
    ngBootstrap(module: new Module()
      ..type(BadgesController)
      ..type(BadgeComponent)
      ..type(CapitalizeFilter)
      ..type(RockAndRoll)
      );
    ```

3. Now the filter can be used in `piratebadge.html`:

    ```HTML
    <badge name="{{ctrl.pirateName | capitalize}}" style='float: left; margin-left: 20px;' rock-and-roll></badge>
    ```
 >Here, we pipe the `pirateName` through the filter.
 
4. Run `piratebadge.html`. Try to modify the input content and see how the name is capitalized.

<a name="hints"></a>
> **Hints:**
> 
> - [Introducing Filters](https://github.com/angular/angular.dart.tutorial/wiki/Introducing-filters-and-services#introducing-filters)

## [Home](../README.md) | [< Previous](step-7.md) | [Next >](step-9.md)

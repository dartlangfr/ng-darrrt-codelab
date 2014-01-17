## 8. Keep the page empty until it has been initialized.
> **Goal**: As a user I don't want to see `{{bla-bla}}` when I land on the page

_**Keywords**: cloak_

>The `ng-cloak` Directive combined with some CSS rules that you add to your app’s main CSS file allow you to avoid this blink. The blink happens between the time your HTML loads and Angular is bootstrapped and has compiled the DOM and has substituted in the real values for the uncompiled DOM values.

1. In `piratebadge.html`:
 - Add the style to be used until Angular is bootstrapped:
  
    ```HTML
    <style type="text/css">
    [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak, .x-ng-cloak {
       display: none !important;
    }
     </style>
    ```
 - Add the `ng-cloak` directive on the body tag:
 
    ```HTML
    <body bagdes ng-cloak>
    ```

2. Run `piratebadge.html`. You shouldn't see any mustache on the page.

## [Home](../README.md) | [< Previous](step-7.md)

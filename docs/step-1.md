### What is Angular ?
Angular is a client-side structural framework for creating dynamic web applications. It uses HTML as the template language and allows you to extend HTML to accommodate the needs of your application.
Angular helps you extend HTML’s syntax to create custom elements and attributes that contain application behavior. Angular reduces the need to do DOM manipulation as Directives create reusable components that do most of what you need without requiring you to repeat DOM boilerplate everywhere. This allows you to concentrate on your application’s logic, and not on how to trick the browser into doing what you want.
The MVC pattern from Angular’s perspective: Separate applications into distinct presentation, data, and logic components. Encourage loose coupling between these components.

## 1. Run the skeleton app.
> **Goal**: In this step, you open the source files, familiarize yourself with the Dart and HTML code, and run the app.

_**Keywords**: main, pub, Dartium, Angular_

1. Dart comes with a bunch of tools like Pub. Pub is the dependency manager built in the langage. Its configuration is define by the `pubspec.yaml` file in the root of project, take a look on this last.

	```	
	name: ng-darrrt-codelab
	description: A one hour excercice, based on the Darrrt project, to learn AngularDart.
	dependencies:
      angular: any
      browser: any
  	```
	> - Thanks to this file, you can define the name, the description of our project and many dependencies by adding a `name_of_your_dependency: version_of_your_dependency` line in the `dependencies` section (be careful, the YAML format that is used by the pubspec file is sensitive to tabulation). In our case we define that the project needs the `browser`, `shadow_dom` and the `angular` dependencies in any version.
	>  - The `browser` dependency is used in Dart browser apps to check for native Dart support and either (a) bootstrap Dartium or (b) load compiled JS instead.
	>  - The `angular` dependency is obviously the port of the Angular framework in Dart.
	> - All available dependencies in Dart are stored and listed on the [pub.dartlang.org](http://pub.dartlang.org/) web site.

-----------------------------
> **Note**: If you have already done the [Official Darrrt Code Lab](https://www.dartlang.org/codelabs/darrrt/), you already know how to run the app. You can jump to the **[next step](step-2.md)**.

-----------------------------

1. Expand the `1-blankbadge` directory.
  In Dart Editor, expand the `1-blankbadge` directory by clicking the little arrow ► to the left of its name. 
  The directory contains two files, `piratebadge.html` and `piratebadge.dart`.
2. Open the files.
  Open both files, `piratebadge.html` and `piratebadge.dart`, by double-clicking each filename in Dart Editor.
3. Review the code.
  Get familiar with the HTML and the Dart code for the skeleton version of the app.
  - piratebadge.html

    ```HTML
    <html>
      <head>
        <meta charset="utf-8">
        <title>Pirate badge</title>
        <link rel="stylesheet" href="../piratebadge.css">
      </head>
      <body>
        <h1>Pirate badge</h1>
        
        <div class="widgets">
          TO DO: Put the UI widgets here.
        </div>
        <div class="badge">
          <div class="greeting">
            Arrr! Me name is
          </div>
          <div class="name">
            <span id="badgeName"> </span>
          </div>
        </div>
    
        <script src="packages/shadow_dom/shadow_dom.min.js"></script>
        <script type="application/dart" src="piratebadge.dart"></script>
        <script src="packages/browser/dart.js"></script>
      </body>
    </html>
    ```
 > - The first `<script>` tag is here to emulate ShadowDom on browsers that don't support this natively.
 > - The second `<script>` tag identifies the main file that implements the app. Here, it’s the `piratebadge.dart` file.
 > - The Dart Virtual Machine (Dart VM) runs Dart code natively. The Dart VM is built into Dartium, a special build of the Chromium browser in which you can run Dart apps natively.
 > - The `packages/browser/dart.js` script checks for native Dart support and either bootstraps the Dart VM or loads compiled JavaScript instead.
  - piratebadge.dart
  
    ```Dart
    void main() {
      // Your app starts here.
    }
    ```
 > - This file contains the entry point for the app—the `main()` function. The `<script>` tags in the `piratebadge.html` file start the application by running this function.
 > - The `main()` function is a top-level function.
 > - A top-level variable or function is one that is declared outside a class definition.
4. Run the app.
  To run the app in Dart Editor, select `piratebadge.html` and click the Run button ![Run button](img/run.png).
  
  ![Click the run button](img/clickrun.png).

  Dart Editor launches _Dartium_, a special build of Chromium that has the Dart Virtual Machine built in, and loads the `piratebadge.html` file. 
  The `piratebadge.html` file loads the app and calls the `main()` function.  
  You should see a TO DO comment on the left and a red and white name badge on the right.
  

## [Home](../README.md) | [Next >](step-2.md)

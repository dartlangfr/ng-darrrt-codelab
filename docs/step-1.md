## 1. Run the skeleton app.
> **Goal**: In this step, you open the source files, familiarize yourself with the Dart and HTML code, and run the app.

_**Keywords**: TODO_

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
    
        <script type="application/dart" src="piratebadge.dart"></script>
        <script src="packages/browser/dart.js"></script>
      </body>
    </html>
    ```
 > **TODO: check if it's the same for our code lab**
 > - During this code lab, all the changes you make to `piratebadge.html` are within the `<div>` element identified with the class `widgets`.
 > - In later steps, the `<span>` element with the ID `badgeName` is programmatically updated by the Dart code based on user input.
 > - The first `<script>` tag identifies the main file that implements the app. Here, it’s the `piratebadge.dart` file.
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

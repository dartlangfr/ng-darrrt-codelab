library badge;

import 'package:angular/angular.dart';

@NgComponent(
    selector: 'badge',
    templateUrl: 'badge/badge_component.html',
    cssUrl: 'badge/badge_component.css',
    publishAs: 'ctrl',
    map: const {
      'name' : '@name',
    }
)
class BadgeComponent {
  String name;
}

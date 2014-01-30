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

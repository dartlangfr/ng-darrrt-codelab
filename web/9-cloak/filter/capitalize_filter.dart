library category_filter;

import 'package:angular/angular.dart';

@NgFilter(name: 'capitalize')
class CapitalizeFilter {
  call(String name) {
    if (name == null || name.isEmpty) return '';
    return name[0].toUpperCase() + name.substring(1);
  }
}


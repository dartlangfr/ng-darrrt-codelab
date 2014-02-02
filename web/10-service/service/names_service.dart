library names_service;

import 'package:angular/angular.dart';
import 'dart:async';
import 'dart:math';

@NgInjectableService()
class NamesService {
  static final Random indexGen = new Random();

  final Http _http;

  static List<String> names;
  static List<String> appellations;

  NamesService(this._http);

  Future load() {
    if (names != null) return new Future.value(true);
    // TODO inject the location
    return _http.get('piratenames.json').then((HttpResponse response) {
      names = response.data['names'];
      appellations = response.data['appellations'];
    });
  }

  String randomName() => _oneRandom(names);

  String randomAppellation() => _oneRandom(appellations);

  String _oneRandom(List<String> list) => list[indexGen.nextInt(list.length)];
}
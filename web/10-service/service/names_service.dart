library names_service;

import 'package:angular/angular.dart';
import 'dart:async';
import 'dart:math';

@NgInjectableService()
class NamesService {
  static final Random indexGen = new Random();

  final Http _http;

  List<String> _names;
  List<String> _appellations;

  NamesService(this._http);

  Future _load() {
    if (_names != null) return new Future.value(true);
    // TODO inject the location
    return _http.get('piratenames.json').then((HttpResponse response) {
      _names = response.data['names'];
      _appellations = response.data['appellations'];
    });
  }

  Future<String> randomName() =>
      _load().then((_) => _oneRandom(_names));

  Future<String> randomAppellation() =>
      _load().then((_) => _oneRandom(_appellations));

  String _oneRandom(List<String> list) => list[indexGen.nextInt(list.length)];
}
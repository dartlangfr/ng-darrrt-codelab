library server;

import 'package:http_server/http_server.dart';
import 'dart:io';
import 'dart:async';

main() {
  runZoned(() {
    HttpServer.bind('0.0.0.0', 8888).then((server) {
      new VirtualDirectory('../build')
        ..allowDirectoryListing = true
        ..serve(server);
      print('Server on port 8888 is running...');
    });
  },
  onError: (e, stackTrace) => print('Error: $e $stackTrace'));
}
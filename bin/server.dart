library dartup_controll;

import "dart:async";
import "dart:io";

import "package:redstone/server.dart" as app;
import "package:di/di.dart";

part "src/interceptor/auth.dart";
part "src/routers/ping.dart";
part "src/dynamodb.dart";

@app.Route("/")
helloWorld() => "Hello, World!";

typedef Future<bool> AuthFunction(String token);

Future<bool> auth(String token){
  return new Future.value(false);
}

main(List<String> args){
  app.addModule(new Module()
    ..bind(AuthFunction, toValue: auth));
  
  app.setupConsoleLog();
  app.start();
}
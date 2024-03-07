import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolive/feature/splash/presentation/views/splash_view.dart';

import 'Shared/ObServer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const ToDoLiveApp());
}

class ToDoLiveApp extends StatelessWidget {
  const ToDoLiveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
///////////////////////////////////////////
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //////////////////////////

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}

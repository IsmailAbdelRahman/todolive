import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Modules/Screens/Button_Navi_Bar.dart';
import 'Shared/ObServer.dart';

void main() {
  //Bloc.observer = MyBlocObserver ();
  BlocOverrides.runZoned(
    // () =>   runApp(const ToDoLive()),
    () {
      runApp(const ToDoLive());
    },

    blocObserver: MyBlocObserver(),
  );
}

class ToDoLive extends StatelessWidget {
  const ToDoLive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
///////////////////////////////////////////
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //////////////////////////

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: P_ButtonNaviBar(),
      /*  home: Setting(),*/
    );
  }
}

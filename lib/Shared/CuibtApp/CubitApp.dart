import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolive/feature/archive_view/presentation/view/archive_view.dart';
import 'package:todolive/feature/home_todo/presetation/view/todo.dart';

import 'StateApp.dart';

class CubitApp extends Cubit<SuperstateApp> {
  CubitApp() : super(InitialStateApp());

  static CubitApp get(context) => BlocProvider.of(context);

  Color bColors = Colors.white;
/////////////////////////////////
  List<Map> mapListID = [];
  List<Map> mapListDone = [];

  List<Widget> itemsScreens = [ToDoView(), const ArchiveView()];
  int? c1 = 0xff009688;
  Color colorr = Colors.transparent;
  int index = 0;
  Database? database;
  bool isBottomShow = false;
  IconData icon = Icons.add_circle_outline;
  Color colorFolatActionBu = Colors.blue;
/////////////////////////////

  void changeIndext(int indext) {
    index = indext;
    emit(IndexStateChange(indext));
  }

////////////////////////////////Create

  Future createDatabase() {
    return openDatabase(
      'ToDoLive.dp',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
                ' CREATE TABLE TODOLIVE (ID INTEGER PRIMARY KEY ,TITLE TEXT , DATA TEXT , TIME TEXT , STATUS TEXT , COLORCARD INTEGER ) ')
            .then((value) {})
            .catchError((error) {});
      },
      onOpen: (database) {
        //GetDataBase(database) ;
        //this.database =database;
        // emit(CreateDataBaseState());
      },
    ).then((value) {
      getDataBase(value);
      database = value;
      emit(CreateDataBaseState());
    });
  }

////////////////////////////Insert

  Future insertDataBase(
      {String? title, String? data, String? time, int? colorCard}) async {
    return await database!.transaction((txn) => txn
            .rawInsert(
                'INSERT INTO TODOLIVE(TITLE , DATA , TIME , STATUS , COLORCARD)  VALUES ( "$title" , "$data" , "$time" , "New" , "$colorCard"  )')
            .then((value) {
          emit(IInsertDataBaseState());
          getDataBase(database);
        }));
  }

/////////////////////////// get

  void getDataBase(database) {
    mapListID = [];
    mapListDone = [];
    database.rawQuery('SELECT * FROM  TODOLIVE ').then((value) {
      //MapListID = value ,

      value.forEach((element) {
        if (element['STATUS'] == 'done') {
          mapListDone.add(element);
        } else if (element['STATUS'] == 'New') {
          mapListID.add(element);
        }
      });
      emit(GetDataBaseState());
    });
  }
///////////////////////////////////////

  void deleteElementDatabase(int id) {
    database!
        .rawDelete('DELETE FROM TODOLIVE WHERE ID = ?', ['$id']).then((value) {
      getDataBase(database);
      emit(DeleteElementDatabaseState());
    });
  }

//////////////////

  void updateDataBase({String? state, int? id}) {
    database?.rawUpdate('UPDATE TODOLIVE SET status = ? WHERE id = ? ', [
      state,
      '$id'
    ]).then((value) => {getDataBase(database), emit(UpdateDataBaseState())});
  }

  /////////////

  void isButtonState(bool isButtonShowstate1, IconData icon0, Color c1) {
    isBottomShow = isButtonShowstate1;
    icon = icon0;
    colorFolatActionBu = c1;

    emit(ButtonShowstate());
  }

  Widget colorsBox(int c) {
    return GestureDetector(
        onTap: () {
          c1 = c;
        },
        child: Container(
          padding: const EdgeInsets.all(7),
          width: 25,
          decoration: BoxDecoration(
              color: Color(c), borderRadius: BorderRadius.circular(10)),
          child: const Text(' '),
        ));
  }
//////////////////////
}

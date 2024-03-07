import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sqflite/sqflite.dart';

import '../../Modules/Screens/Home.dart';
import '../../Modules/Screens/Setting.dart';
import '../../Modules/Screens/todo.dart';
import 'StateApp.dart';

class CubitApp extends Cubit<SuperstateApp> {
  CubitApp() : super(InitialStateApp());

  static CubitApp get(context) => BlocProvider.of(context);

/////////////////////////////////
  // هلسن عليهم من هنا
  List<Map> MapListID = [];
  List<Map> MapListDone = [];
/*
  Database? database;
  Database? d1;
  var K1FloatingActionBar = GlobalKey<ScaffoldState>();
  bool isBottomShow = false;
  Color ColorFolatActionBu = Colors.blue;
  var Controll_Text = TextEditingController();
  var Controll_Time = TextEditingController();
  var Controll_Date = TextEditingController();
  var Keyfrom = GlobalKey<FormState>();
  IconData icon = Icons.add_circle_outline;
  Color? c1;
  Color BColors = Colors.transparent;
*/

  List<Widget> itemsScreens = [
    Container(
      color: Colors.redAccent,
    ),
    const P_Home(),
    const P_toDo(),
    const Setting()
  ];
  int? c1 = 0xff009688;
  Color Colorr = Colors.redAccent;
  int index = 1;
  Database? database;
  bool isBottomShow = false;
  IconData icon = Icons.add_circle_outline;
  Color ColorFolatActionBu = Colors.orangeAccent;
/////////////////////////////
// امتا هروح اعمل حاله هناك وميثود هنا لما يكون فيه متغير بلعب ف الارقام بنقص او ازود
// مثال
  void ChangeIndext(int indext) {
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
            .then((value) {
          print('createTable');
        }).catchError((error) {
          print('Error:========= $error');
        });
      },
      onOpen: (database) {
        print('open database ');
        //GetDataBase(database) ;
        //this.database =database;
        // emit(CreateDataBaseState());
      },
    ).then((value) {
      GetDataBase(value);
      database = value;
      emit(CreateDataBaseState());
    });
  }

////////////////////////////Insert

  Future IInsertDataBase(
      {String? Title, String? Dtat, String? Time, int? COLORCARD}) async {
    return await database!.transaction((txn) => txn
            .rawInsert(
                'INSERT INTO TODOLIVE(TITLE , DATA , TIME , STATUS , COLORCARD)  VALUES ( "$Title" , "$Dtat" , "$Time" , "New" , "$COLORCARD"  )')
            .then((value) {
          emit(IInsertDataBaseState());
          GetDataBase(database);
        }));
  }

/////////////////////////// get

  void GetDataBase(database) {
    MapListID = [];
    MapListDone = [];
    database.rawQuery('SELECT * FROM  TODOLIVE ').then((value) {
      //MapListID = value ,

      value.forEach((element) {
        if (element['STATUS'] == 'done') {
          MapListDone.add(element);
        } else if (element['STATUS'] == 'New') MapListID.add(element);
      });
      emit(GetDataBaseState());
      print('value print : $value');
      // print('--------- ${  value[1]['COLORCARD' ]} ');
      //  Colorr =c1!
    });
  }
///////////////////////////////////////

  void DeleteElementDatabase(int id) {
    database!
        .rawDelete('DELETE FROM TODOLIVE WHERE ID = ?', ['$id']).then((value) {
      GetDataBase(database);
      emit(DeleteElementDatabaseState());
    });
  }

//////////////////

  void updateDataBase({String? state, int? id}) {
    database?.rawUpdate('UPDATE TODOLIVE SET status = ? WHERE id = ? ', [
      state,
      '$id'
    ]).then((value) => {GetDataBase(database), emit(updateDataBaseState())});

    print('$state , $id');
  }

  /////////////

  void isButtonState(bool isButtonShowstate1, IconData icon0, Color C1) {
    isBottomShow = isButtonShowstate1;
    icon = icon0;
    ColorFolatActionBu = C1;

    emit(ButtonShowstate());
  }

  Widget ColorsBox(int c) {
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

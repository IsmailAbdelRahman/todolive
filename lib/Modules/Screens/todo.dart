
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';


import '../../Shared/Components/Conponents.dart';
import '../../Shared/CuibtApp/CubitApp.dart';
import '../../Shared/CuibtApp/StateApp.dart';



class P_toDo extends StatefulWidget {
 const P_toDo({Key? key}) : super(key: key);

@override
  State<P_toDo> createState() => _P_toDoState();
}

class _P_toDoState extends State<P_toDo> {
  var K1FloatingActionBar = GlobalKey<ScaffoldState>();
  var Controll_Text = TextEditingController();
  var Controll_Time = TextEditingController();
  var Controll_Date = TextEditingController();
  var Keyfrom = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    CubitApp CubitObj =BlocProvider.of(context);

    return
      Scaffold(
        key: K1FloatingActionBar,
        floatingActionButton: FloatingActionButton(
          backgroundColor: CubitObj.ColorFolatActionBu,
          onPressed: () {

            if (CubitObj.isBottomShow) {
              if (Keyfrom.currentState!.validate()) {
                CubitObj.IInsertDataBase(
                    Title: Controll_Text.text,
                    Dtat: Controll_Date.text,
                    Time: Controll_Time.text,
                    COLORCARD: CubitObj.c1
                );
                /* .then((value) => {
                      CubitObj.GetDataBase(CubitObj.d1)
                          .then((value) => {

                     // MapListID = value,
                        print('database:: ${value.toString()}')
                      })
                          .catchError((e) {
                        print(
                            'e:$e');

                     //   print('database:: ${d1.toString()}');

                      }),
                   //   Navigator.pop(context),
                    });*/

                Navigator.pop(context);

              }
            } else {
              K1FloatingActionBar.currentState!
                  .showBottomSheet(
                      (context) => Padding(
                    padding: const EdgeInsets.only(
                        top: 40, right: 20, left: 20),
                    child: Form(
                        key: Keyfrom,
                        child: SizedBox(
                          width: double.infinity,
                          height: 315,
                          child: Column(children: [ Expanded(
                            flex: 5,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CostumeTextFF(
                                    TextLabel: ' \t Task TiTle',
                                    Ico: Icons.text_fields,
                                    TEC: Controll_Text),
                                const Spacer(flex: 1,),
                                CostumeTextFF(
                                    TEC: Controll_Time,
                                    KryType: TextInputType.none,
                                    TextLabel: '\t Task Time',
                                    Ico: Icons.access_time,
                                    OnTap: () => showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      Controll_Time.text =
                                          value!.format(context);
                                    })) ,
                                const Spacer(flex: 1,),
                                CostumeTextFF(
                                    TEC: Controll_Date,
                                    KryType: TextInputType.none,
                                    TextLabel: '\t Task Data',
                                    Ico: Icons.date_range,
                                    OnTap: () => showDatePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime.parse(
                                          '2050-02-20'),
                                    ).then((value) {
                                      Controll_Date.text =
                                          DateFormat.yMMMd()
                                              .format(value!);
                                    })) ,const Spacer(flex: 1,)
                              ],
                            ),
                          ), Expanded( flex: 1,  child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              CubitObj. ColorsBox(Colors.redAccent.value),
                              const SizedBox(
                                width: 10,
                              ),
                              CubitObj. ColorsBox(Colors.amber.value),
                              const SizedBox(
                                width: 10,
                              ),
                              CubitObj.ColorsBox(Colors.teal.value),
                              const SizedBox(
                                width: 10,
                              ),
                              CubitObj. ColorsBox(Colors.pink.value),
                              const SizedBox(
                                width: 50,
                              )
                            ],
                          )
                          )],),
                        )

                    ),
                  ),
                  elevation: 20,
                  backgroundColor: Colors.blueAccent[50],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  enableDrag: true)
                  .closed
                  .then((value) => {
                //   Navigator.pop(context),
                /// لو قفلت من الشده الكلوز دا معناه انى ميحفظش حاجه ويفتح من جديد
                CubitObj.isButtonState(false, Icons.add_circle_outline , Colors.blue),
                // print("Close"),
                //    Obj.icon = Icons.add_circle_outline,
                //  Obj.IconState(Icons.add_circle_outline)
                // ColorFolatActionBu = Colors.blue;
              });

              /// لو مقفلتش من الشده الكلوز هيخليها ترو بالتالى هيروح لل الانسيرت ال فوق
              CubitObj.isButtonState(true,  Icons.check , Colors.orangeAccent);
              //isBottomShow = true;
              // Obj. icon = Icons.check;
              //  ColorFolatActionBu = Colors.orangeAccent;

            }
          },
          child: Icon(CubitObj.icon , color: Colors.white),
        ),






        body: Container(
          width:double.maxFinite,height: double.maxFinite,
          decoration: const BoxDecoration(gradient:LinearGradient(
            begin: Alignment.topCenter ,end: Alignment.bottomCenter,tileMode:TileMode.mirror ,
            colors: [
              Colors.white,
              //Colors.yellow
              Color(0xFFE0F7FA),
            ] ,
          )
          ),
          child: BlocConsumer<CubitApp ,SuperstateApp>(
            listener: (context ,state){},
            builder: (context ,state)=>  CubitApp.get(context).MapListID.length ==0 ?Stack(children: [ Center(child: Text('add Taskes  '  , style: TextStyle(fontSize: 40 , color: Colors.pink  ),  ))   ,   Center(child: Lottie.asset('assets/Lottie/co.json')) ], ) :
           SafeArea(
                child: ListView.builder(
                  itemCount: CubitApp.get(context).MapListID.length,
                 itemBuilder: (_,indext){
                  return
                   CoustClumeToDo(C1:  Color(CubitApp.get(context).c1!),M: CubitApp.get(context).MapListID[indext] ,context: context );

                },


            ),
            ),
          )
        ),
      );

  }
/*

Widget CoustClumeToDo({  required Map M   , Color ? C1 = Colors.teal   }){
    return  Dismissible(key: Key(M['ID'].toString()),  onDismissed: (di){  CubitApp.get(context).DeleteElementDatabase(M['ID']);},
        child:    Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(10),
      shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(10) ),

      elevation: 10,
      child: ListTile(
        leading:CircleAvatar(
          backgroundColor:Color(M['COLORCARD']),
          maxRadius: 15,

          child: const CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 9,),
        )  ,title:Text(M['TITLE'] ), trailing:SizedBox(
        width: 150,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [ SizedBox(  width: 140, child: Row(children: [ Spacer(flex: 1),IconButton(onPressed: (){
              print( " Status : ${M['STATUS']}  \n , ID :${M['ID']} "  );
              CubitApp.get(context).updateDataBase(state: 'done' ,id: M['ID']);

              print(M['STATUS']);
              // print(' --------------------------- ${M['COLORCARD'] } ');
            }, icon: Icon(Icons.check_box  ,color: Colors.blueGrey,)) ,IconButton(onPressed: (){}, icon:Icon( Icons.archive_outlined)) */
/*,Spacer(flex: 1) , Text(M['TIME'] )*//*
],)) , Spacer(flex:3), SizedBox( width:3    , child : Divider(color: Color(M['COLORCARD']), height: 100,thickness: 50, ))  ]),
      ), subtitle: Text(M['DATA']),  )

      ,
    )

    );
}
*/

}


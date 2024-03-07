import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Shared/Components/Conponents.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';

import '../../Shared/CuibtApp/CubitApp.dart';
import '../../Shared/CuibtApp/StateApp.dart';




class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      body:Stack(
        children: [
          Yang(C1: Colors.white ,C2: Colors.teal),

          
          
        ],
      )
    );*/
      Container(
        color: Colors.teal,

  /*        width:double.maxFinite,height: double.maxFinite,
          decoration: const BoxDecoration(gradient:LinearGradient(
            begin: Alignment.topCenter ,end: Alignment.bottomCenter,tileMode:TileMode.mirror ,
            colors: [
              Colors.white,
              //Colors.yellow
              Color(0xFFE0F7FA),
            ] ,
          )
          ),*/



          child: BlocConsumer<CubitApp ,SuperstateApp>(
            listener: (context ,state){},
            builder: (context ,state)=>
                SafeArea(
                  child: ListView.builder(
                    itemCount: CubitApp.get(context).MapListDone.length,
                    itemBuilder: (_,indext){
                      return
                        CoustClumeToDo(C1:  Color(CubitApp.get(context).c1!),M: CubitApp.get(context).MapListDone[indext] , context: context );
                    },



                  ),
                ),
          )
      );
  }

/*  Widget CoustClumeToDo({  required Map M   , Color ? C1 = Colors.teal  , context  }){
    return  Card(
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
            }, icon: Icon(Icons.check_box  ,color: Colors.blueGrey,)) ,IconButton(onPressed: (){}, icon:Icon( Icons.archive_outlined)) *//*,Spacer(flex: 1) , Text(M['TIME'] )*//*],)) , Spacer(flex:3), SizedBox( width:3    , child : Divider(color: Color(M['COLORCARD']), height: 100,thickness: 50, ))  ]),
      ), subtitle: Text(M['DATA']),  )

      ,
    );
  }*/


}

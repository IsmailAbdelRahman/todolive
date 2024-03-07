import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../CuibtApp/CubitApp.dart';




Widget CostumeTextFF(
        {String? TextLabel,
          IconData? Ico,
        TextEditingController? TEC,
        @required TextInputType? KryType,
        @required bool SecuriTy = false,
        Function(String)? OnChanged,
        VoidCallback? SufixFun,
          VoidCallback? OnTap,

        }) =>
    TextFormField(
        onTap:OnTap ,
      onChanged: OnChanged,
      obscureText: SecuriTy,
      controller: TEC,
      keyboardType: KryType,
      validator: (v1) {
        //validator : validator//ممكن اعملها هناك
        if (v1!.isEmpty) {
          return 'empty';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(

        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          label: TextLabel != null ? Text(TextLabel) : null,
          suffixIcon: Ico != null
              ? IconButton(icon: Icon(Ico), onPressed: SufixFun)
              : null),
    );


//////////////////////////////////////////////

Widget MAt2(
    {String? Time = 'الوقت',
    String? Name = 'اكتب الاسم',
    String? ImageIO = 'assets/images/s1.png',
    IconData? Ico ,
    VoidCallback? OnTa,
    String ? ImageIO2Lottie =  'assets/Lottie/icoo.json' ,
    }) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
    child: Material(
      color: Colors.white,
      elevation: 13,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //  clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(

     //  splashColor: Colors.black26,
        onTap: OnTa,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 150,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Expanded(
              flex: 5,
              child: Stack(
                clipBehavior:Clip.none,
              //  overflow: Overflow.visible,
                children: [
                  /*Positioned(
                    child: Lottie.asset('assets/Lottie/co.json'  ,width: 500 ,height: 500),
                    top: -15,
                    left: -20,
                  ),*/
                  Lottie.asset('assets/Lottie/co.json' ,height: 500 , width: 500),
                  Positioned(
                  //  child: Ico == null ? const Icon(Icons.abc) : Icon(Ico),
                    //  child: Image.asset(ImageIO2! ,width: 50 , height: 50),
                    child: Lottie.asset( ImageIO2Lottie!,width: 50 ,height: 50),
                    top: -15,
                   left: -20,
                  ),
                  SizedBox(
                    height: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              Name!,
                              style:
                                  const TextStyle(fontFamily: 'aref', fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                        Expanded(
                          flex: 6,
                          //    child: Ink.image(image:  NetworkImage(NetImage ),fit: BoxFit.cover )
                          child: Stack(
                            clipBehavior: Clip.none,
                            //overflow: Overflow.visible,
                            children: [
                              Positioned(
                                  top: -27,
                                  child: Image.asset(
                                 //   ImageIO! ==null ? 'assets/images/s1.png' : ImageIO!,
                                    ImageIO!,
                                    height: 150,
                                    width: 200,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: Text(' ' + Time!)  )
          ]),
        ),
      ),
    ),
  );
}
//////////////////////////////////
Widget Fk() {
  return Container(
    color: Colors.red,
    margin: const EdgeInsets.only(top: 20),
    width: 100,
    height: 100,
    child: Stack(
      clipBehavior: Clip.none,
      //overflow: Overflow.visible,
      children: [
        Positioned(
            top: -30,
            child: Image.asset(
              'assets/images/s1.png',
              height: 100,
              width: 100,
            ))
      ],
    ),
  );
}

///////////////////////
Widget Yang( {@required Color C1 =Colors.black , @required Color C2=Colors.white }  ){

  return Stack(
    children: [
      Column(
        children: [
          Expanded(
            child: Container(
              color: C2,
              child: Container(
                decoration:  BoxDecoration(
                    color:C1,
                    borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(50))),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: C1,
              child: Container(
                  decoration:  BoxDecoration(
                      color: C2,
                      borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(50)))),
            ),
          )
        ],
      )
    ],
  );

}


 Widget CoustemBuild ( {Map? l} ){

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [CircleAvatar(radius: 50,child:Text('M'),) ,Text(l!['TITLE']) , Text(l['TIME']) ],);


}
///////////////// مربعات تغير الالوان

////////////////
Widget CoustClumeToDo({  required Map M   , Color ? C1 = Colors.teal  , context   }){
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
              }, icon: Icon(Icons.check_box  ,color: Colors.blueGrey,)) ,IconButton(onPressed: (){}, icon:Icon( Icons.archive_outlined)) /*,Spacer(flex: 1) , Text(M['TIME'] )*/],)) , Spacer(flex:3), SizedBox( width:3    , child : Divider(color: Color(M['COLORCARD']), height: 100,thickness: 50, ))  ]),
        ), subtitle: Text(M['DATA']),  )

        ,
      )




  );
}
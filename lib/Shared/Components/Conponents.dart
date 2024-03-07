import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../cuibtApp/CubitApp.dart';

Widget costumeTextFF({
  String? textLabel,
  IconData? ico,
  TextEditingController? tEC,
  @required TextInputType? kryType,
  @required bool securiTy = false,
  Function(String)? onChanged,
  VoidCallback? sufixFun,
  VoidCallback? onTap,
}) =>
    TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      obscureText: securiTy,
      controller: tEC,
      keyboardType: kryType,
      validator: (v1) {
        //validator : validator//ممكن اعملها هناك
        if (v1!.isEmpty) {
          return 'empty';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          label: textLabel != null ? Text(textLabel) : null,
          suffixIcon: ico != null
              ? IconButton(icon: Icon(ico), onPressed: sufixFun)
              : null),
    );

//////////////////////////////////////////////

Widget mAt2({
  String? time = 'الوقت',
  String? name = 'اكتب الاسم',
  String? imageIO = 'assets/images/s1.png',
  IconData? ico,
  VoidCallback? onTa,
  String? imageIO2Lottie = 'assets/Lottie/icoo.json',
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
          onTap: onTa,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                  flex: 5,
                  child: Stack(
                    clipBehavior: Clip.none,
                    //  overflow: Overflow.visible,
                    children: [
                      /*Positioned(
                    child: Lottie.asset('assets/Lottie/co.json'  ,width: 500 ,height: 500),
                    top: -15,
                    left: -20,
                  ),*/
                      Lottie.asset('assets/Lottie/co.json',
                          height: 500, width: 500),
                      Positioned(
                        //  child: Ico == null ? const Icon(Icons.abc) : Icon(Ico),
                        //  child: Image.asset(ImageIO2! ,width: 50 , height: 50),
                        top: -15,
                        left: -20,
                        //  child: Ico == null ? const Icon(Icons.abc) : Icon(Ico),
                        //  child: Image.asset(ImageIO2! ,width: 50 , height: 50),
                        child: Lottie.asset(imageIO2Lottie!,
                            width: 50, height: 50),
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
                                  name!,
                                  style: const TextStyle(
                                      fontFamily: 'aref', fontSize: 20),
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
                                        imageIO!,
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
                Expanded(flex: 1, child: Text(' $time!}'))
              ]))),
    ),
  );
}

/////////////////////////////i////
Widget fk() {
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
Widget yang(
    {@required Color c1 = Colors.black, @required Color c2 = Colors.white}) {
  return Stack(
    children: [
      Column(
        children: [
          Expanded(
            child: Container(
              color: c2,
              child: Container(
                decoration: BoxDecoration(
                    color: c1,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50))),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: c1,
              child: Container(
                  decoration: BoxDecoration(
                      color: c2,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50)))),
            ),
          )
        ],
      )
    ],
  );
}

Widget coustemBuild({Map? l}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      const CircleAvatar(
        radius: 50,
        child: Text('M'),
      ),
      Text(l!['TITLE']),
      Text(l['TIME'])
    ],
  );
}
///////////////// مربعات تغير الالوان

////////////////
Widget coustClumeToDo({required Map M, Color? c1 = Colors.teal, context}) {
  return Dismissible(
      key: Key(M['ID'].toString()),
      onDismissed: (di) {
        CubitApp.get(context).deleteElementDatabase(M['ID']);
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(M['COLORCARD']),
            maxRadius: 15,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 9,
            ),
          ),
          title: Text(M['TITLE']),
          trailing: SizedBox(
            width: 150,
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                  width: 140,
                  child: Row(
                    children: [
                      const Spacer(flex: 1),
                      IconButton(
                          onPressed: () {
                            // print(
                            //     " Status : ${M['STATUS']}  \n , ID :${M['ID']} ");
                            CubitApp.get(context)
                                .updateDataBase(state: 'done', id: M['ID']);

                            // print(M['STATUS']);
                            // print(' --------------------------- ${M['COLORCARD'] } ');
                          },
                          icon: const Icon(
                            Icons.check_box,
                            color: Colors.blueGrey,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons
                              .archive_outlined)) /*,Spacer(flex: 1) , Text(M['TIME'] )*/
                    ],
                  )),
              const Spacer(flex: 3),
              SizedBox(
                  width: 3,
                  child: Divider(
                    color: Color(M['COLORCARD']),
                    height: 100,
                    thickness: 50,
                  ))
            ]),
          ),
          subtitle: Text(M['DATA']),
        ),
      ));
}

import 'package:flutter/material.dart';

import 'package:todolive/models/ClassCousFF.dart';

import '../../Shared/Components/Conponents.dart';
import 'P1.dart';
import 'P2.dart';

class P_Home extends StatefulWidget {

  const P_Home({Key? key}) : super(key: key);

  @override
  State<P_Home> createState() => _P_HomeState();
}
List<CousFF> list_CousFF =[
  CousFF(Name: 'العلم'  , Time: '8-9'  ,ImageIC2Lottie: 'assets/Lottie/programer.json' ,Images: 'assets/images/cafe.png'),
  CousFF(Name: 'البرمجه'  , Time: '10-11'  ,ImageIC2Lottie:  'assets/Lottie/99016-happy-developer-white.json'   ,Images: 'assets/images/programer.png' ),
  CousFF(Name: 'القراءه'  , Time: '1-3'  ,ImageIC2Lottie:  'assets/Lottie/mod.json'   ,Images: 'assets/images/boock2.png' ),
  CousFF(Name: 'التنميه البشريه'  , Time: '5-6'  ,ImageIC2Lottie:  'assets/Lottie/mod.json'   ,Images: 'assets/images/s1.png' ),
  CousFF(Name: 'ديني'  , Time: '8-9 pm'  ,ImageIC2Lottie:  'assets/Lottie/6902-exploding-ribbon-and-confetti.json'   ,Images: 'assets/images/O1.png' ),
  CousFF(Name: 'موسيقي'  , Time: 's1'  ,ImageIC2Lottie:  'assets/Lottie/103110-confetti-pop.json'   ,Images: 'assets/images/airpod.png' ),
  CousFF(Name: 'الرياضه'  , Time: 's1'  ,ImageIC2Lottie:  'assets/Lottie/103110-confetti-pop.json'   ,Images: 'assets/images/jame.png' ),
];


List<Widget> P =[P1() , P2()];
class _P_HomeState extends State<P_Home> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   appBar: AppBare(),
      backgroundColor: Colors.teal,
      body:St() ,
    );
  }
}


Widget St (){

  return SafeArea(
    child: Column(children: [
      const SizedBox(height: 10,),
      Expanded(

        child:
           Stack(
            alignment: AlignmentDirectional.topCenter,

              children: [

              //  Yang(C2: Colors.black ,C1: Colors.white),
           Container(

           decoration: const BoxDecoration(
           color: Colors.white,
               borderRadius:BorderRadius.only(topLeft: Radius.circular(40) ,topRight:  Radius.circular(40)  ) ),
           margin: EdgeInsets.only(top: 60),
           ),

                ListView.builder(
                  physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,

                    itemBuilder: (_,ints){

                   return MAt2(Name: list_CousFF[ints].Name ,ImageIO2Lottie: list_CousFF[ints].ImageIC2Lottie ,Time: list_CousFF[ints].Time ,ImageIO: list_CousFF[ints].Images
                      ,OnTa:(){
                         print(ints);
                     Navigator.push(_, MaterialPageRoute(builder:(index){

                       return P[ints];

                     }),);
                       }
                   );

                    },

                 )

          ]),

                            )
    ],),
  );
}

AppBar AppBare(){

  return AppBar( backgroundColor: Colors.teal,  elevation: 0,
  title: Text('DoToLive'),centerTitle: true,
  );
}
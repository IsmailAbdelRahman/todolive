import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../../../Shared/Components/Conponents.dart';
import '../../../../Shared/cuibtApp/CubitApp.dart';
import '../../../../Shared/cuibtApp/StateApp.dart';

class ToDoView extends StatelessWidget {
  var k1FloatingActionBar = GlobalKey<ScaffoldState>();
  var controllText = TextEditingController();
  var controllTime = TextEditingController();
  var controllDate = TextEditingController();
  var keyFrom = GlobalKey<FormState>();

  ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    CubitApp cubitObj = CubitApp.get(context);

    return BlocBuilder<CubitApp, SuperstateApp>(
      builder: (context, state) {
        return Scaffold(
          key: k1FloatingActionBar,
          floatingActionButton: FloatingActionButton(
            backgroundColor: cubitObj.colorFolatActionBu,
            onPressed: () {
              if (cubitObj.isBottomShow) {
                if (keyFrom.currentState!.validate()) {
                  cubitObj.insertDataBase(
                      title: controllText.text,
                      data: controllDate.text,
                      time: controllTime.text,
                      colorCard: cubitObj.c1);

                  controllDate.clear();
                  controllText.clear();
                  controllTime.clear();
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
                cubitObj.isButtonState(true, Icons.check, Colors.orangeAccent);
                cubitObj.bColors = const Color(0xffeae3f3);
                k1FloatingActionBar.currentState!
                    .showBottomSheet(
                        (context) => Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, right: 20, left: 20),
                              child: Form(
                                  key: keyFrom,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 315,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              costumeTextFF(
                                                  textLabel: ' \t Task TiTle',
                                                  ico: Icons.text_fields,
                                                  tEC: controllText),
                                              const Spacer(
                                                flex: 1,
                                              ),
                                              costumeTextFF(
                                                  tEC: controllTime,
                                                  kryType: TextInputType.none,
                                                  textLabel: '\t Task Time',
                                                  ico: Icons.access_time,
                                                  onTap: () => showTimePicker(
                                                        context: context,
                                                        initialTime:
                                                            TimeOfDay.now(),
                                                      ).then((value) {
                                                        controllTime.text =
                                                            value!.format(
                                                                context);
                                                      })),
                                              const Spacer(
                                                flex: 1,
                                              ),
                                              costumeTextFF(
                                                  tEC: controllDate,
                                                  kryType: TextInputType.none,
                                                  textLabel: '\t Task Data',
                                                  ico: Icons.date_range,
                                                  onTap: () => showDatePicker(
                                                        context: context,
                                                        firstDate:
                                                            DateTime.now(),
                                                        initialDate:
                                                            DateTime.now(),
                                                        lastDate:
                                                            DateTime.parse(
                                                                '2050-02-20'),
                                                      ).then((value) {
                                                        controllDate.text =
                                                            DateFormat.yMMMd()
                                                                .format(value!);
                                                      })),
                                              const Spacer(
                                                flex: 1,
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                cubitObj.colorsBox(
                                                    Colors.redAccent.value),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                cubitObj.colorsBox(
                                                    Colors.amber.value),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                cubitObj.colorsBox(
                                                    Colors.teal.value),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                cubitObj.colorsBox(
                                                    Colors.pink.value),
                                                const SizedBox(
                                                  width: 50,
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  )),
                            ),
                        elevation: 20,
                        backgroundColor: Colors.blueAccent[50],
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        enableDrag: true)
                    .closed
                    .then((value) {
                  cubitObj.bColors = const Color(0xFFE0F7FA);
                  cubitObj.isButtonState(
                      false, Icons.add_circle_outline, Colors.blue);
                });
                // .then((value) => {
                //       cubitObj.isButtonState(
                //           false, Icons.add_circle_outline, Colors.blue),
                //     });

                //

                //isBottomShow = true;
                // Obj. icon = Icons.check;
                //  ColorFolatActionBu = Colors.orangeAccent;
              }
            },
            child: Icon(cubitObj.icon, color: Colors.white),
          ),
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
              colors: [
                Colors.white,
                //Colors.yellow
                Color(0xFFE0F7FA),
              ],
            )),
            child: CubitApp.get(context).mapListID.isEmpty
                ? Stack(
                    children: [
                      const Center(
                          child: Text(
                        'add Taskes  ',
                        style: TextStyle(fontSize: 40, color: Colors.pink),
                      )),
                      Center(child: Lottie.asset('assets/Lottie/co.json'))
                    ],
                  )
                : SafeArea(
                    child: ListView.builder(
                      itemCount: CubitApp.get(context).mapListID.length,
                      itemBuilder: (_, indext) {
                        return coustClumeToDo(
                            c1: Color(CubitApp.get(context).c1!),
                            M: CubitApp.get(context).mapListID[indext],
                            context: context);
                      },
                    ),
                  ),
          ),
        );
      },
    );
  }
}

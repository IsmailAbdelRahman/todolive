import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Components/Conponents.dart';
import '../../Shared/CuibtApp/CubitApp.dart';
import '../../Shared/CuibtApp/StateApp.dart';

////////////////////////////////

class P_ButtonNaviBar extends StatelessWidget {
  /*const*/ P_ButtonNaviBar({Key? key}) : super(key: key);

  Color BColors = Colors.white;

  /////////////////////////////

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitApp()..createDatabase(),
      child: BlocConsumer<CubitApp, SuperstateApp>(
          listener: (context, state) {},
          builder: (context, state) {
            //  CubitApp CubitObj = CubitApp.get(context);
            // CubitApp CubitObj =  CubitApp();
            CubitApp CubitObj = BlocProvider.of(context);

            if (state is IndexStateChange) {
              print(state.index);

              if (state.index == 2) CubitObj.isBottomShow = false;
              //     if (state.index ==2)  CubitObj.GetDataBase(CubitObj.database).then((value){  print(value) ;CubitObj.MapListID = value ; CubitObj.createDatabase(); } );
              //  if (state.index==2) { /* CubitObj.MapListID = state.database as List<Map>; */ print(state.database.toString());  }
            }

            return DefaultTabController(
              length: 4,
              initialIndex: 1,
              child: Scaffold(
                // backgroundColor:Colors.redAccent,
                bottomNavigationBar: CurvedNavigationBar(
                    index: 1,
                    onTap: (indexes) {
                      CubitObj.ChangeIndext(indexes);
                      //  index = indexes;

                      if (CubitObj.index == 0) {
                        BColors = Colors.redAccent;
                      } else if (CubitObj.index == 2) {
                        BColors = const Color(0xFFE0F7FA);
                      } else if (CubitObj.index == 3) {
                        BColors = Colors.teal;
                      } else {
                        BColors = Colors.transparent;
                      }
                    },
                    backgroundColor: BColors,
                    buttonBackgroundColor: Colors.transparent.withAlpha(20),
                    items: const [
                      Icon(Icons.search),
                      Icon(Icons.home_filled),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.settings),
                    ]),

                body: CubitObj.itemsScreens[CubitObj.index],
              ),
            );
          }),
    );
  }
}

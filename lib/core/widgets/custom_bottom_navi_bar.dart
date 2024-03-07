import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Shared/cuibtApp/CubitApp.dart';
import '../../Shared/cuibtApp/StateApp.dart';

////////////////////////////////

class CustomBottomNaviBar extends StatelessWidget {
  const CustomBottomNaviBar({Key? key}) : super(key: key);

  /////////////////////////////

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitApp()..createDatabase(),
      child: BlocConsumer<CubitApp, SuperstateApp>(
          listener: (context, state) {},
          builder: (context, state) {
            CubitApp cubitObj = CubitApp.get(context);
            // CubitApp CubitObj =  CubitApp();

            if (state is IndexStateChange) {
              if (state.index == 2) cubitObj.isBottomShow = false;
            }

            return DefaultTabController(
              length: 4,
              initialIndex: 1,
              child: Scaffold(
                // backgroundColor:Colors.redAccent,
                bottomNavigationBar: CurvedNavigationBar(
                    index: cubitObj.index,
                    onTap: (indexes) {
                      cubitObj.changeIndext(indexes);
                      //  index = indexes;

                      if (cubitObj.index == 0) {
                        cubitObj.bColors = const Color(0xFFE0F7FA);
                      } else if (cubitObj.index == 1) {
                        cubitObj.bColors = Colors.teal;
                      } else {
                        cubitObj.bColors = Colors.transparent;
                      }
                    },
                    backgroundColor: cubitObj.bColors,
                    buttonBackgroundColor: Colors.transparent.withAlpha(20),
                    items: const [
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.settings),
                    ]),

                body: cubitObj.itemsScreens[cubitObj.index],
              ),
            );
          }),
    );
  }
}

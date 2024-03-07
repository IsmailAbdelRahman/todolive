import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolive/Shared/Components/Conponents.dart';
import 'package:todolive/Shared/cuibtApp/CubitApp.dart';
import 'package:todolive/Shared/cuibtApp/StateApp.dart';

class ArchiveView extends StatelessWidget {
  const ArchiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.teal,
        child: BlocConsumer<CubitApp, SuperstateApp>(
          listener: (context, state) {},
          builder: (context, state) => SafeArea(
            child: ListView.builder(
              itemCount: CubitApp.get(context).mapListDone.length,
              itemBuilder: (_, indext) {
                return coustClumeToDo(
                    c1: Color(CubitApp.get(context).c1!),
                    M: CubitApp.get(context).mapListDone[indext],
                    context: context);
              },
            ),
          ),
        ));
  }
}

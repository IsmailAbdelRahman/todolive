import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolive/Modules/Counter/Cubit.dart';
import 'package:todolive/Modules/Counter/states.dart';

class P2 extends StatelessWidget {


  Widget build(BuildContext context) {

 /*   CounterCubit  obj = CounterCubit();
    CounterCubit obj1 =BlocProvider.of(context);
    //   CounterCubit.get(context).Plus();
*/

    return  BlocProvider(
        create: ( context )=> CounterCubit(),
        child:  BlocConsumer<CounterCubit , CounterStates>(
          listener: (context, state){
            if (state is CounterPlusStates){ print('CounterPlusState ${state.CounterTTPl}'  ); }
            if (state is CounterMinusStates){print ('CounterMinusStates ${state.CounterTTMi}');}
            },
          builder: (context, state) =>   Scaffold(
            body: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize:MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [TextButton(onPressed: (){
                      CounterCubit.get(context).plus();
                    }, child: Text('+') ,
                    )   , Text('${CounterCubit.get(context).Count}')  ,TextButton(onPressed: (){

                        CounterCubit.get(context).Count==0 ? CounterCubit.get(context).Count==0 : CounterCubit.get(context).minus();


                    }, child: Text('-')) ])),
          ),

        )
    );


}

}


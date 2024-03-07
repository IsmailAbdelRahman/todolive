import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolive/Modules/Counter/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialStates());
//code

////////
/*  CounterCubit s1 = CounterCubit();
  static  CounterCubit get1 (context)=> s1;*/

  static CounterCubit get(context) => BlocProvider.of(context);

  int Count = 1;
  void plus() {
    Count++;
    emit(CounterPlusStates(Count));
    //emit(CounterMinusStates(Count)); // رفرش
  }

  void minus() {
    Count--;
    emit(CounterMinusStates(Count));
  }
}

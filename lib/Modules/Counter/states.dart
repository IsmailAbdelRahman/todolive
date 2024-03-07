
abstract class CounterStates {}

class CounterInitialStates extends CounterStates {}
class CounterPlusStates extends CounterStates {
   int? CounterTTPl;
    CounterPlusStates(this.CounterTTPl);
}
class CounterMinusStates extends CounterStates {
  int? CounterTTMi;
  CounterMinusStates(this.CounterTTMi);
}







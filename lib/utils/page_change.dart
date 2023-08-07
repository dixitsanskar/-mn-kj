// state_controller.dart


class StateController {
  // Define the shared state variables
  int _counter = 0;
  bool _click = false;
  // Define a callback function to notify the stateful classes when the state changes

  // Define getter for the counter
  int get counter => _counter;
  bool get click => _click;
  void set clicked(bool event)
  {
    _click = event;
  }

  // Define a method to update the counter and notify the stateful classes
  void set updateCounter(int value) {
    _counter = value;
  }
}

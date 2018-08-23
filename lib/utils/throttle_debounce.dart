import 'dart:async';

class Throttler{
  
  Duration delay;
  var callback;
  List args;
  bool noTrailing;

  Throttler(this.delay, this.callback, this.args, [this.noTrailing=false]);

  var timeoutId;

  DateTime lastExec = new DateTime.now();

  void throttle() {
  
    Duration elapsed = new DateTime.now().difference(lastExec);

    void exec() {
      lastExec = new DateTime.now();
      callback(args);
    }

    if(elapsed.compareTo(delay) >= 0) {
      exec();
    }
    //cancel the timeout scheduled for trailing callback 
    if(timeoutId != null)
      timeoutId.cancel();

    if( noTrailing == false) {
      //there should be a trailing callback, so schedule one
      //buggy here, should be 'delay - elasped' but dart async only supports const Duration for delay
      timeoutId = new Timer(delay, exec); 
    }
  }
}

class Debouncer {

  Duration delay;
  var callback;
  List args;
  bool atBegin;

  Debouncer(this.delay, this.callback, this.args, [this.atBegin=false]);
  
  var timeoutId;
  
  void debounce() {
    
    void exec() {
      callback(args);
    }
    
    void clear() {
      timeoutId = null;
    }
    //cancel the previous timer if debounce is still being called before the delay period is over
    if(timeoutId != null) {
      timeoutId.cancel();
    }
    //if atBegin is true, 'exec' has to executed the first time debounce gets called
    if(atBegin && timeoutId == null) {
      exec();
    }
    //schedule a new call after delay time
    timeoutId = new Timer(delay, atBegin ? clear : exec);
  }

}


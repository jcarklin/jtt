import 'dart:collection';

enum HoleIndex{
  BACK_TOP,BACK_BOTTOM,FRONT_BOTTOM,FRONT_TOP
}
enum TurnDirection {
  FORWARD,BACKWARD,NONE
}

enum Twist {
  S_TWIST, Z_TWIST
}

class Tablet {

  UnmodifiableListView<Thread> _threads; //limited to number of holes, immutable 
  int _deckIndex;
  Twist _twist; //S or Z

  //When both are none is is probably at start of weaving
  TurnDirection _lastTurn=TurnDirection.NONE;
  TurnDirection _nextTurn=TurnDirection.NONE;

  Tablet(this._deckIndex, int holeCount, this._twist) {
    
    List<Thread> threadList = List(holeCount);
    for (int i=0; i<holeCount; i++) {
      threadList[i] = new Thread(i,"none");
    }
    _threads = new UnmodifiableListView(threadList);
  }

  Tablet._(List<Thread> threadList, this._twist, TurnDirection turnDirection){
    _threads = new UnmodifiableListView(threadList);
    _nextTurn = TurnDirection.NONE;
    _lastTurn = turnDirection;
  }

  threadTablet(int threadIndex, String colour) {
    _threads[threadIndex].colour=colour;
  }

  set twist(Twist twist) {this._twist = twist;}
  set turnDirection(TurnDirection direction) {this._nextTurn = direction;}

  int getIndexInRange(index, length) {
    var trim = index % length;
    var nonNegative = trim + length;
    return nonNegative % length;
  }
  
  String getAngle() {
    if (_lastTurn==TurnDirection.NONE) {
      return '|';
    }
    return (_twist==Twist.S_TWIST &&_lastTurn==TurnDirection.FORWARD)?'/':'\\';
  }

  Tablet turn() {
    int i = 1 % _threads.length;
    List<Thread> threadList = _threads.sublist(i)..addAll(_threads.sublist(0, i));
    return new Tablet._(threadList, _twist, _nextTurn);
  }
  

  @override
  String toString() {   
    return ('\nCard Number $_deckIndex: '+(_twist==Twist.S_TWIST?'S - ':'Z - ')+ getAngle())+'\n'+_threads.toString();
  }

  getColour() {
    return _threads[1].colour;
  }
}
  
class Thread {
  String _colour;
  int _holeIndex;
  
  Thread(this._holeIndex, this._colour);

  String get colour => _colour;

  set colour(String colour) {
    _colour = colour;
  }

  @override
  String toString() {
    return "Thread ${_holeIndex}: ${_colour}\n";
  }

}
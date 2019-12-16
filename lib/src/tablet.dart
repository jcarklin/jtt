import 'dart:collection';

enum HoleIndex{
  BACK_TOP,BACK_BOTTOM,FRONT_BOTTOM,FRONT_TOP
}
enum TurnDirection {
  FORWARD,BACKWARD,NONE
}

class Tablet {
  UnmodifiableListView<Thread> _threads; //limited to number of holes, immutable 
  bool _clockwise=true;
  bool _sTwist; //S or Z 
  TurnDirection _turnedDir;//Forwards or Backwards

  Tablet(List<Thread> threads, this._sTwist, this._clockwise) {
    this._threads = new UnmodifiableListView(threads);
  }

  bool get clockwise => _clockwise;
  set twist(bool twist) {this._sTwist = twist;}
  set turnDirection(TurnDirection direction) {this._turnedDir = direction;}

  int getIndexInRange(index, length) {
    var trim = index % length;
    var nonNegative = trim + length;
    return nonNegative % length;
  }

  String getAngle() {
    return (_sTwist &&_turnedDir==TurnDirection.FORWARD)?'/':'\\';
  }

  @override
  String toString() {
    String colours = _clockwise?'Clockwise':'Anticlockwise';
    int index;
    
    for(int i = 0; i < _threads.length; i++) {
      index = getIndexInRange(_clockwise?0 + i:0-i, _threads.length);
      colours += '\n$i: '+_threads[index].colour;
    }
     
    return ((_sTwist?'S - ':'Z - ')+ getAngle() + colours);
  }
}
  
class Thread {
  String _colour;

  Thread(this._colour);

  String get colour => _colour;

  set colour(String colour) {
    _colour = colour;
  }

  @override
  String toString() {
    return _colour;
  }

}
import 'dart:collection';

class Tablet {
  UnmodifiableListView<Thread> _threads; //limited to number of holes, immutable 
  List<Pick> _picks = List();
  Pick _nextPick;
  bool _clockwise=true;
  

  Tablet(this._threads, bool sTwist, this._clockwise) {
      _picks.add(Pick(sTwist, false, _threads, this));
      _nextPick==null;
  }

  bool get clockwise => _clockwise;

  int getIndexInRange(index, length) {
    var trim = index % length;
    var nonNegative = trim + length;
    return nonNegative % length;
  }

  @override
  String toString() {
    String colours = _clockwise?'Clockwise':'Anticlockwise';
    int index;
    
    for(int i = 0; i < _threads.length; i++) {
      index = getIndexInRange(_clockwise?0 + i:0-i, _threads.length);
      colours += '\n$i: '+_threads[index].colour;
    }
     
    return (_picks[0].sTwist?'S - '+_picks[0].toString():'Z - '+_picks[0].toString())+colours;
  }
}
  
class Thread {
  int indexOnCard;
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

class Pick {
  bool sTwist; //S or Z 
  bool turnedForward;//Forwards or Backwards
  UnmodifiableListView<Thread> threadsState;
  Tablet parentCard;

  Pick(this.sTwist, this.turnedForward, this.threadsState, this.parentCard);

  @override
  String toString() {
    return (sTwist==turnedForward)?'/':'\\';
  }
}
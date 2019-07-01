class Tablet {
  List<Thread> _threads; //limited to number of holes, immutable 
  List<Pick> _picks = List();
  Pick _nextPick;
  
  Tablet(bool sTwist, int numHoles) {
      _threads = List(numHoles);
      _nextPick = Pick(sTwist, null, null, this);
  }

  threadTablet(int threadIndex, Thread thread) {
      _threads[threadIndex] = thread;
  }

  turnTablet() {
    _picks.add(_nextPick);
    _nextPick = null;  
  }

  bool isReadyToTurn() {
    if (_picks.isEmpty) {
      _picks.add(_nextPick);
      _nextPick == null;
    }
    return _nextPick==null;
  }

  prepareTurn(bool isForward, bool sTwist) {
    if (!isReadyToTurn()) {
      List<int> nextState = List();
      if (isForward) {
        nextState.add(_picks.last._threadsState[nextState.length]);
        nextState.addAll(_picks.last._threadsState.sublist(0,nextState.length-1));
      } else {
        nextState.addAll(_picks.last._threadsState.sublist(1,nextState.length));
        nextState.add(_picks.last._threadsState[0]);      
      }
      _nextPick = Pick(sTwist, isForward, nextState, this);
    }
  }

  @override
  String toString() {
    Pick printPick = isReadyToTurn()?_picks.last:_nextPick;
    String to = (isReadyToTurn()?'Card is ready to turn!':'Turn is complete ') + printPick.toString();
    to += _threads.isEmpty?'No threads yet':_threads.toString();
    to += '\n';
    return to;
  }
  
}
  
class Thread {
  int indexOnCard;
  String _colour;

  Thread(this._colour);

  set colour(String colour) {
    _colour = colour;
  }

  @override
  String toString() {
    return _colour;
  }

}

class Pick {
  bool _sTwist; //S or Z 
  bool _turnedForward;//Forwards or Backwards
  List<int> _threadsState;
  Tablet _parentCard;

  Pick(this._sTwist, this._turnedForward, this._threadsState, this._parentCard);

  @override
  String toString() {
    String to = _sTwist?'S - ':'Z - ';
    return to + ((_sTwist==_turnedForward)?'/':'\\');
  }
}
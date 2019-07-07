class Tablet {
  List<Thread> _threads; //limited to number of holes, immutable 
  List<Pick> _picks = List();
  Pick _nextPick;
  
  Tablet(bool sTwist, int numHoles) {
      _threads = List.generate(numHoles, (holeIndex)=>Thread(holeIndex,null) );
      _picks.add(Pick(sTwist, null, _threads.map((thread)=> thread.cardIndex).toList(), this));
  }

  threadTablet(int threadIndex, Thread thread) {
      _threads[threadIndex] = thread;
  }

  turnTablet() {
    _picks.add(_nextPick);
    _nextPick = null;  
  }

  bool isReadyToTurn() {
    return _nextPick!=null;
  }

  prepareTurn(bool isForward, {bool sTwist}) {
    if (!isReadyToTurn()) {
      List<int> nextState = List();
      if (isForward) {
        nextState.addAll(_picks.last._threadsState.sublist(0,_threads.length-1));
        nextState.insert(0,_picks.last._threadsState[_threads.length-1]);
      } else {
        nextState.addAll(_picks.last._threadsState.sublist(1));
        nextState.add(_picks.last._threadsState[0]);      
      }
      _nextPick = Pick(sTwist==null?_picks.last.sTwist:sTwist, isForward, nextState, this);
    }
  }

  @override
  String toString() {
    Pick printPick = _picks.last;
    String to = (isReadyToTurn()?'Ready to turn':'Not ready for turning') + '\t'+ printPick.toString();
    printPick._threadsState.forEach((threadIndex)=> to += _threads[threadIndex].toString()+', ');
    to += '\n';
    return to;
  }
  
}
  
class Thread {
  int _indexOnCard;
  String _colour;

  Thread(this._indexOnCard, this._colour);

  int get cardIndex => _indexOnCard;

  String get colour => _colour;

  set colour(String colour) {
    _colour = colour;
  }

  @override
  String toString() {
    return ('['+(colour==null?'':colour)+']');
  }

}

class Pick {
  bool _sTwist; //S or Z 
  bool _turnedForward;//Forwards or Backwards
  List<int> _threadsState;
  Tablet _parentCard;

  Pick(this._sTwist, this._turnedForward, this._threadsState, this._parentCard);

  get sTwist => _sTwist;

  @override
  String toString() {
    String to = ('Twist: ' + (_sTwist?'- S - ':'- Z - '));
    return to + (_turnedForward==null?'':((_sTwist==_turnedForward)?' / ':' \\ '));
  }
}
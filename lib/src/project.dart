import 'package:jtt_commandline/src/tablet.dart';

class Project {
    // variables which will set when creating new project
    int holeCount; //Currently set for all tablets in a project. 
    int tabletCount;//the number of tablets in a project
    int weavingType;//Threaded-In, Double Weave, Twill, etc
    List<Tablet> deck;
    List<Pick> picks;//draw from bottom up

    Project(this.holeCount, this.tabletCount, this.weavingType) {
      deck = List(tabletCount);
      for (int i=0; i<tabletCount; i++) {
        deck[i]=new Tablet(i,holeCount, Twist.S_TWIST);
      }
    }

    threadTablet(int deckIndex, int threadIndex, String colour) {
      deck[deckIndex].threadTablet(threadIndex, colour);
    }

    twistTablet(int deckIndex, Twist twist) {
      deck[deckIndex].twist = twist;
    }

    prepareTurn(int deckIndex, TurnDirection direction) {
      deck[deckIndex].turnDirection = direction;
    }

    Pick lastPick() {
      if (picks==null) {
        picks = new List();
        return new Pick(0,deck); 
      } else {
        return picks.last;
      }
    }

    turnDeck() {
      Iterable<Tablet> turnedList;
      turnedList = lastPick().deck.map((tablet)=>tablet.turn());
      picks.add(new Pick(picks.length,turnedList.toList()));
    }

    printDeck() {
      print(deck.toString());
    }

    printPicks() {
      print(picks.toString());
    }
}

class Pick {
  List<Tablet> deck;
  int pickIndex;

  Pick(this.pickIndex,this.deck);

  @override
  String toString() {
    return(deck.map((f) => f.printPick()).toList().reduce((value, element) => value + ' ~ ' + element));
  }
}
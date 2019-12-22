import 'package:jtt_commandline/src/project.dart';
import 'package:jtt_commandline/src/tablet.dart';

main(List<String> arguments) {

  Project project = Project(4, 10, 0);
  project.printDeck();
  //Thread cards
  for (int i=0; i<project.deck.length; i++) {
    project.threadTablet(i, 0, "Red");
    project.threadTablet(i, 1, "Black");
    project.threadTablet(i, 2, "Black");
    project.threadTablet(i, 3, "Red");
    if (i%2==0) {
      project.twistTablet(i, Twist.Z_TWIST);
    }
  }

  project.printDeck();
  //prepare to turn all cards forward
  for (int i=0; i<project.deck.length; i++) {
    project.prepareTurn(i, TurnDirection.FORWARD);
  } 
  //Turn cards
  project.turnDeck();
  project.printPicks();
  //prepare to turn all cards forward
  for (int i=0; i<project.deck.length; i++) {
    project.prepareTurn(i, TurnDirection.FORWARD);
  } 
  project.turnDeck();
  project.printPicks();
  
}




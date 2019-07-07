import 'package:jtt_commandline/src/project.dart';
import 'package:jtt_commandline/src/tablet.dart';

main(List<String> arguments) {
  
  Project firstProject = new Project();
  firstProject.createDeck(10, 4);
  print('Deck has been created');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.cards.forEach((tablet)=>tablet.threadTablet(0, Thread(0,'red')));
  firstProject.deck.cards.forEach((tablet)=>tablet.threadTablet(1, Thread(1,'green')));
  firstProject.deck.cards.forEach((tablet)=>tablet.threadTablet(2, Thread(2,'blue')));
  firstProject.deck.cards.forEach((tablet)=>tablet.threadTablet(3, Thread(3,'yellow')));
  print('First thread set to red');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.cards.forEach((tablet)=>tablet.prepareTurn(true));
  print('Deck prepared for turning');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.turnCards();
  print('Deck Turned Forward');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.cards.forEach((tablet)=>tablet.prepareTurn(true));
  print('Deck prepared for turning');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.turnCards();
  print('Deck Turned Forward');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.cards.forEach((tablet)=>tablet.prepareTurn(false));
  print('Deck prepared for turning');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.turnCards();
  print('Deck Turned Backwards');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.cards.forEach((tablet)=>tablet.prepareTurn(false, sTwist: false));
  print('Deck prepared for turning (twisted)');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.turnCards();
  print('Deck Turned Backwards');
  print('======================');
  firstProject.printDeck();
}




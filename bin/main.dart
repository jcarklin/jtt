import 'dart:collection';

import 'package:jtt_commandline/src/project.dart';
import 'package:jtt_commandline/src/tablet.dart';

main(List<String> arguments) {
  
  Project firstProject = new Project();
  Deck deck = firstProject.createDeck(10, 4);
  print('Deck has been created');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.cards.forEach((tablet)=>tablet.threadTablet(0, Thread('red')));
  print('First thread set to red');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.cards.forEach((tablet)=>tablet.prepareTurn(true, true));
  print('Deck prepared for turning');
  print('======================');
  firstProject.printDeck();

  firstProject.deck.turnCards();
  print('Deck Turned');
  print('======================');
  firstProject.printDeck();
}




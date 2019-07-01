import 'tablet.dart';

class Project {

  Deck _deck;

  Project();

  createDeck(int _numberOfCards, int _holesPerCard) {
    _deck = Deck(_numberOfCards, _holesPerCard);
  }

  printDeck() {
    print(_deck);
  }

  Deck get deck => _deck;
}

class Deck {
  List<Tablet> cards;
   
  Deck(int _numberOfCards, int holesPerCard) {
    cards = new List(_numberOfCards);
    for (int i=0; i< cards.length; i++) {
      cards[i]=(Tablet(true, holesPerCard));
    }
  }

  turnCards() {
    cards.forEach((tablet) => tablet.turnTablet());
  }

  @override
  String toString() {
    return cards.toString();
  }
}


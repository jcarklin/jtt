import 'tablet.dart';

class Project {
  int _numberOfCards = 10;
  int _holesPerCard = 4;
  Deck _deck;

  Project(this._numberOfCards, this._holesPerCard) {
    _deck = Deck(_numberOfCards, _holesPerCard);
  }

}

class Deck {
  List<Tablet> cards;

  Deck(int numberOfCards, int holesPerCard) {
    cards = new List(numberOfCards);
    for (int i=0; i< cards.length; i++) {
      cards.add(Tablet(List.filled(holesPerCard, Thread('none')), true, true));
    }
  }

  turnCards() {
    cards.forEach((tablet) => tablet.turn());
  }

}


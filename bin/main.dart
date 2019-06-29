import 'dart:collection';

import 'package:jtt_commandline/src/tablet.dart';

main(List<String> arguments) {

  List<Thread> threads = List();
  threads.add(Thread('Red')); 
  threads.add(Thread('Green')); 
  threads.add(Thread('Blue')); 
  threads.add(Thread('Yellow'));

  Tablet tablet = Tablet(UnmodifiableListView(threads), true, true);
  print(tablet);
  tablet = Tablet(UnmodifiableListView(threads), true, false);
  print(tablet);

}




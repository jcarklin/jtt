import 'package:jtt_commandline/src/tablet.dart';

main(List<String> arguments) {

  List<Thread> threads = List();
  threads.add(Thread('Red')); 
  threads.add(Thread('Green')); 
  threads.add(Thread('Blue')); 
  threads.add(Thread('Yellow'));

  Tablet tablet = Tablet(threads, true, true);
  print(tablet);
  tablet = Tablet(threads, true, false);
  print(tablet);
  tablet = Tablet(threads, false, true);
  tablet.turnDirection=TurnDirection.FORWARD;
  print(tablet);

  tablet = Tablet(threads, false, false);
  tablet.turnDirection=TurnDirection.BACKWARD;
  print(tablet);
}




import 'package:flutter_tic_tac_toe/services/sound.dart';
import 'package:get_it/get_it.dart';

import 'alert.dart';
import 'board.dart';


GetIt locator = new GetIt();

void setupLocator() {
  locator.registerSingleton(BoardService());
  locator.registerSingleton(SoundService());
  locator.registerSingleton(AlertService());
}

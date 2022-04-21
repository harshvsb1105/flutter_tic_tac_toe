import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/button.dart';
import 'package:flutter_tic_tac_toe/components/logo.dart';
import 'package:flutter_tic_tac_toe/pages/game.dart';
import 'package:flutter_tic_tac_toe/pages/pick.dart';
import 'package:flutter_tic_tac_toe/pages/settings.dart';
import 'package:flutter_tic_tac_toe/services/alert.dart';
import 'package:flutter_tic_tac_toe/services/board.dart';
import 'package:flutter_tic_tac_toe/services/provider.dart';
import 'package:flutter_tic_tac_toe/services/sound.dart';
import 'package:flutter_tic_tac_toe/theme/theme.dart';

class StartPage extends StatelessWidget {
  final boardService = locator<BoardService>();
  final soundService = locator<SoundService>();
  final alertService = locator<AlertService>();

  StartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.65],
              colors: [
                MyTheme.orange,
                MyTheme.yellow,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Tic Tac Toe",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 65,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'DancingScript'),
                    ),
                    Text(
                      "Flutt",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 65,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'DancingScript'),
                    ),
                    // Logo(),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Button(
                      onTap: () {
                        boardService.gameMode$.add(GameMode.Solo);
                        // soundService.playSound('click');

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PickPage(),
                          ),
                        );
                      },
                      height: 40,
                      width: 250,
                      borderRadius: 250,
                      color: Colors.white,
                      child: Text(
                        "single player".toUpperCase(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 30),
                    Button(
                      onTap: () {
                        boardService.gameMode$.add(GameMode.Multi);
                        soundService.playSound('click');

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => GamePage(),
                          ),
                        );
                      },
                      color: Colors.white,
                      height: 40,
                      width: 250,
                      borderRadius: 250,
                      child: Text(
                        "with a friend".toUpperCase(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 60),
                    Button(
                      onTap: () {
                        soundService.playSound('click');
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            fullscreenDialog: false,
                            builder: (context) => SettingsPage(),
                          ),
                        );
                      },
                      color: Colors.white,
                      height: 50,
                      width: 80,
                      borderRadius: 20,
                      child: Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

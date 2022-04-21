import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/button.dart';
import 'package:flutter_tic_tac_toe/components/o.dart';
import 'package:flutter_tic_tac_toe/components/x.dart';
import 'package:flutter_tic_tac_toe/services/board.dart';
import 'package:flutter_tic_tac_toe/services/provider.dart';
import 'package:flutter_tic_tac_toe/services/sound.dart';
import 'package:flutter_tic_tac_toe/theme/theme.dart';

import 'game.dart';

class PickPage extends StatefulWidget {
  _PickPageState createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  final boardService = locator<BoardService>();
  final soundService = locator<SoundService>();

  String groupValue = 'X';
  void setGroupvalue(value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Pic Your Favourite",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => setGroupvalue("O"),
                        child: O(100, MyTheme.green),
                      ),
                      Radio(
                        onChanged: (e) => setGroupvalue(e),
                        activeColor: MyTheme.orange,
                        value: 'O',
                        groupValue: groupValue,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Second",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => setGroupvalue('X'),
                        child: X(100, 20),
                      ),
                      Radio(
                        onChanged: (e) => setGroupvalue(e),
                        activeColor: MyTheme.orange,
                        value: 'X',
                        groupValue: groupValue,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "First",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Button(
                onTap: () {
                  boardService.resetBoard();
                  boardService.setStart(groupValue);
                  if (groupValue == 'O') {
                    boardService.player$.add("X");
                    boardService.botMove();
                  }
                  soundService.playSound('click');

                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => GamePage(),
                    ),
                  );
                },
                height: 40,
                width: 250,
                borderRadius: 200,
                gradient: [MyTheme.orange, MyTheme.yellow],
                child: Text(
                  "next".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

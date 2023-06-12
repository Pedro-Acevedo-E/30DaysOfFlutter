import 'package:day_07/board_tile.dart';
import 'package:day_07/tile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //Were ensuring the app can only run in landscape
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  //A list filled with 9 elements (TileState.empty)
  var boardState = List.filled(9, TileState.empty);
  var turn = TileState.cross;
  var winner = TileState.empty;
  var titleText = "Tic Tac Toe";
  var turnCount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
          appBar: AppBar(
          title:  Text(titleText),
        ),
          body: Center(
            child: Stack(
              children: [
                Image.asset("assets/board.png"),
                boardTiles(),
              ],
            ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: reset,
          tooltip: "Restart game",
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
  Widget boardTiles() {
    return Builder(builder: (context){
      final boardDimension = MediaQuery.of(context).size.width;
      final tileDimension = boardDimension / 3;

      return SizedBox(
        width: boardDimension,
        height: boardDimension,
        child: Column(
          children: [
            Row(children: [
              BoardTile(tileDimension: tileDimension, tileState: boardState[0], onPressed: () => updateTileStateForIndex(0)),
              BoardTile(tileDimension: tileDimension, tileState: boardState[1], onPressed: () => updateTileStateForIndex(1)),
              BoardTile(tileDimension: tileDimension, tileState: boardState[2], onPressed: () => updateTileStateForIndex(2)),
            ],),
            Row(children: [
              BoardTile(tileDimension: tileDimension, tileState: boardState[3], onPressed: () => updateTileStateForIndex(3)),
              BoardTile(tileDimension: tileDimension, tileState: boardState[4], onPressed: () => updateTileStateForIndex(4)),
              BoardTile(tileDimension: tileDimension, tileState: boardState[5], onPressed: () => updateTileStateForIndex(5)),
            ],),
            Row(children: [
              BoardTile(tileDimension: tileDimension, tileState: boardState[6], onPressed: () => updateTileStateForIndex(6)),
              BoardTile(tileDimension: tileDimension, tileState: boardState[7], onPressed: () => updateTileStateForIndex(7)),
              BoardTile(tileDimension: tileDimension, tileState: boardState[8], onPressed: () => updateTileStateForIndex(8)),
            ],),
          ],
        ),
      );
    });
  }

  void updateTileStateForIndex(int selectedIndex) {
    if (boardState[selectedIndex] == TileState.empty && winner == TileState.empty) {
      setState(() {
        boardState[selectedIndex] = turn;
        turn = turn == TileState.cross ? TileState.circle : TileState.cross;
      });
    }
    findWinner();
  }

  void checkWinner(int a, int b, int c) {
      if(boardState[a] != TileState.empty) {
        if(boardState[a] == boardState[b] && boardState[b] == boardState[c]) {
          setState(() {
            winner = boardState[a];
            titleText  = "The winner is ${winner.name}";
            showWinnerDialog(winner);
          });
        }
      }
  }

  void findWinner() {
    checkWinner(0, 1, 2);
    checkWinner(3, 4, 5);
    checkWinner(6, 7, 8);
    checkWinner(0, 3, 6);
    checkWinner(1, 4, 7);
    checkWinner(2, 5, 8);
    checkWinner(0, 4, 8);
    checkWinner(2, 4, 6);
  }

  void reset() {
    setState(() {
      boardState = List.filled(9, TileState.empty);
      turn = TileState.cross;
      winner = TileState.empty;
      titleText = "Tic Tac Toe";
    });
  }

  void showWinnerDialog(TileState tileState) {
    final context = navigatorKey.currentState!.overlay!.context;
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("The winner is!"),
            content: Image.asset(
                tileState == TileState.cross ? "assets/x.png" : "assets/o.png"
            ),
            actions: [ElevatedButton(
                onPressed: () {
                  reset();
                  Navigator.of(context).pop();
                },
                child: const Center(child: Text("New Game!")))],
          );
        });
  }
}


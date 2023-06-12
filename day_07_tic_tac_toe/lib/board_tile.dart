import 'package:day_07/tile_state.dart';
import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {
  final TileState tileState;
  final double tileDimension;
  final VoidCallback onPressed;

  const BoardTile({super.key, required this.tileDimension, required this.onPressed, required this.tileState});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: tileDimension,
        height: tileDimension,
        child: InkWell(
          onTap: onPressed,
          child: widgetForTileState(),
        ),
    );
  }

  Widget widgetForTileState() {
    Widget widget;

    switch (tileState) {
      case TileState.empty: {
        widget = Container();
      }
      break;
      case TileState.cross: {
        widget = Image.asset("assets/x.png");
      }
      break;
      case TileState.circle: {
        widget = Image.asset("assets/o.png");
      }
      break;
    }
    return widget;
  }
}
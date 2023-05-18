import 'package:day_16_17_pokedex/app_localizations_context.dart';
import 'package:day_16_17_pokedex/utils/constants/constants.dart';
import 'package:flutter/material.dart';

Widget pageSelector(int count, BuildContext context) {
  final pages = List.generate(count~/paginationNumber, (int index) => index);
  return PopupMenuButton(
      color: pokedexColor.withOpacity(0.8),
      constraints: popupMenuConstraints,
      initialValue: 1,
      onSelected: (int item) {
        goToPage(context, item*paginationNumber);
      },
      itemBuilder: (BuildContext context) => pageItems(pages, context),
      child: popupMenuIcon
  );
}

List<PopupMenuItem<int>> pageItems(List<int> items, BuildContext context) {
  List<PopupMenuItem<int>> list = [];
  for(var i = 0; i < items.length; i++) {
    list.add(
        PopupMenuItem<int>(
          value: items[i],
            child: Text("${context.loc.page} ${items[i] + 1}"),
        )
    );
  }
  return list;
}
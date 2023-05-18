import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../navigation/navigation_bloc.dart';
import '../../navigation/navigation_event.dart';

const int paginationNumber = 24;
const Color pokedexColor = Colors.red;
const String appTitle = "Pokedex";

const popupMenuConstraints = BoxConstraints(maxHeight: 300, minWidth: 100);
const popupMenuIcon = Icon(Icons.reorder);

String pageUrl(String query) => "https://pokeapi.co/api/v2/pokemon/?offset=$query&limit=$paginationNumber";
void goToPage(BuildContext context, query) => BlocProvider.of<NavigationBloc>(context).add(GoToPageEvent(page: pageUrl((query).toString())));